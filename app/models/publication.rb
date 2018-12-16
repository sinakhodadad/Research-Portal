class Publication < ActiveRecord::Base
    validates :title, presence: true
    validates :year, presence: true
    validates :page, presence: true
    validates :pageend, presence: true
    validates :volume, presence: true
    validates :journal_id, presence: true

    validates :page, numericality: {only_integer: true, greater_than: 0}
    validates :pageend, numericality: {only_integer: true, greater_than: 0}
    validates :volume, numericality: {only_integer: true, greater_than: 0}
    validates :year, numericality: {only_integer: true, less_than_or_equal_to: Date.today.year.to_i}

    belongs_to :journal
    has_many :user_publications
    has_many :users, through: :user_publications

    has_attached_file :document
    validates_attachment :document, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}



    def self.create_with_user(publication_params, user_params)
        publication = Publication.new(publication_params)
        begin
            Project.transaction do
                publication = Publication.create!(publication_params)
                UserPublication.transaction do

                    if (user_params.any?)
                        user_params[:user_id].each do |user_id|
                            user = User.find_by_id(user_id)
                            if (user.nil?)
                                ActiveRecord::Rollback
                                publication.errors.add(:notice, "Error in save data")
                                return publication
                            end
                            begin
                                UserPublication.create!([user_id: user.id, publication_id: publication.id])
                            rescue
                                publication.errors.add(:notice, "Error in save data")
                                ActiveRecord::Rollback
                                return publication
                            end
                        end
                    end
                end
            end
        rescue
            ActiveRecord::Rollback
            publication.errors.add(:notice, "Error in save data")
            return publication
        end
        return publication
    end


    def update_with_user(publication_params, user_params)
        begin
            Publication.transaction do
                UserPublication.transaction do
                    if not self.update(publication_params)
                        return false
                    end


                    user_publications = UserPublication.where(publication_id: self.id)
                    if not user_publications.nil?
                        user_publications.delete_all
                    end

                    if (user_params.any?)
                        user_params[:user_id].each do |user_id|

                            # byebug

                            user = User.find_by_id(user_id)
                            if (user.nil?)
                                ActiveRecord::Rollback
                                self.errors.add(:users, "user dosn't exist")
                                return false
                            end
                            UserPublication.create!([user_id: user_id, publication_id: self.id])
                            # byebug

                        end
                    end
                end
            end
        rescue
            self.errors.add(:notice, "error")
            return false
        end
        return true
        # byebug
    end

end
