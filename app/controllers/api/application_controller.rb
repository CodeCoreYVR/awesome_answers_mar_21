class Api::ApplicationController < ApplicationController
  # Use this controller to share methods among only the api controllers.

  # When making POST, PATCH, and DELETE requests to controllers, 
  # the rails authenticity token will be provided. This isn't
  # needed for public HTTP apis, so we'll skip it.
  skip_before_action(:verify_authenticity_token)

  #The priority for rescue_from is in the reverse oreder of where the calls are made,
  #meaning that more specific errors should be rescued last and general errors should be
  #rescued first

  #The StandardError class is an ancestro of all the errors that programmers
  #could possibly cause in their program. Rescuing from it will prevent nearly
  #all errors from crashing the program
  #NOTE: Use this very carefully and make sure to always log the error messages in some form

  rescue_from StandardError, with: :standard_error

  #There is a built-in Rails "rescue_from" method we can use to prevent class crashes. 
  #You pass the error class you want to rescue, and give it the named method
  #you want to rescue it with
  # 'rescue_from' is a method that usable inside controllers
  # to prevent applications from crashing when an exception (a
  # crash)  occurs. if given a 'with:' with a symbol named after,
  # a  method will be called instead of crashing a program.

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  # To send a json error message when a user types in, for example: localhost:3000/api/v1/wrongthing
  def not_found
    render(
      json: {
        errors: [{
          type: "Not Found"
        }]
      },
      status: :not_found #alias for 404 in rails
    )
  end

  private

  def authenticate_user!
    unless current_user.present?
      render(
        json: { status: 401 },
        status: 401, # Unauthorized
      )
    end
  end

  protected
  #  protected is like a private except that it prevents
  # descendent classes from using protected methods

  def record_invalid(error)
    #Our object should look something like this:
    # {
    #   errors: [
    #     {
    #       type: "ActiveRecord::RecordInvalid",
    #       record_type: "Question",
    #       field: "body",
    #       message: '...'
    #     }
    #   ]
    # }

    invalid_record = error.record
    errors = invalid_record.errors.map do |field, message|
      {
        type: error.class.to_s, #need it in string format
        record_type: invalid_record.class.to_s,
        field: field,
        message: message
      }
    end
    render(
      json: { status: 422, errors: errors },
      status: 422 #alias is :unprocessable_entity
    )
  end
  
  def record_not_found(error)
    render(
      status: 404,
      json: {
        status: 404,
        errors: [{
          type: error.class.to_s,
          message: error.message
          }]
        }
      )
  end
    
  def standard_error(error)
      #When we rescue an error, we prevent our program from
      #doing what it would normally do in a crash, such as logging
      #the details and the backtrace.  It's important to always log this
      #information when rescuing a general type
  
      #Use the logger.error method with an error's message to 
      #log the error details again
  
      logger.error error.full_message
  
      render(
        status:500,
        json:{
          status:500, #alias :internal_server_error
          errors:[{
            type: error.class.to_s,
            message: error.message
          }]
        }
      )
  end
end
