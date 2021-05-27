class User < ApplicationRecord
    has_secure_password
    # What it needs
    # has_secure_password need password digest column in the database user table 
    # has_secured_password needs gem bcrypt

    # What it provides
    # validation: it will automatically add presence validation for the password field
    # Cross verify each other 'password' and 'password confirmation', so it will add 2 attribute accessors for the 'password' and password_confirmation
    # it is an optional but if we have this, has_secure_password will perform validation on it for us.
    # Once the password is validated and verified,it saves the password in an ecrypted form using brypt and stores in a db , in password_digest column for us
    # it will add a 'authenticate' method to verify user's password. if called with the correct password, it will return 'true' or 'false' based on if the password is correct or not
    has_many :questions, dependent: :nullify
    has_many :answers, dependent: :nullify
    has_many :job_posts, dependent: :nullify

    has_many :likes, dependent: :destroy
    has_many :liked_questions, through: :likes, source: :question
    
    # has_and_belongs_to_many(
    #     :liked_questions, #this is the name that we want to give this association
    #     {
    #         class_name: 'Question', #Name of the model we are associating to
    #         join_table: 'likes', #Name of the join table
    #         association_foreign_key: 'question_id', #This is the name of the key which will act as a foreign key
    #         foreign_key: 'user_id' #This is the name of the key that will be used as foreign key in the join table of this table
    #     }
    # )

    #GEOCODE
    #We are stating that we will be converting the address with geocode
    geocoded_by :address
    #And when a user saves an address, it will automatically convert to lonitude and latitude
    #and will automatically be saved in the respective user columns
    after_validation :geocode

    def full_name
        "#{first_name} #{last_name}"
    end

end
