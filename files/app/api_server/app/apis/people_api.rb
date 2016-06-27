class PeopleApi < Grape::API
 resource :people do
  desc 'Get a list of people'
  params do
    optional :ids, type: Array, desc: 'Array of person ids'
  end
  get do
    people = params[:ids] ? Person.where(id: params[:ids]) : Person.all
    represent people, with: PersonRepresenter
  end


  desc 'Create a person'
  params do
    optional :name, type: String, desc: 'The Name of the person'
    optional :job_title, type: String, desc: 'The Job Title of the person'
    optional :email, type: String, desc: 'The Email Address of the person'
  end

  post do
    person = Person.create!(permitted_params)
    represent person, with: PersonRepresenter
  end



  params do
    requires :id, desc: 'ID of the person'
  end
  route_param :id do
    desc 'Get a person'
    get do
      person = Person.find(params[:id])
      represent person, with: PersonRepresenter
    end

    desc 'Update a person'
    params do
      optional :name, type: String, desc: 'The Name of the person'
      optional :job_title, type: String, desc: 'The Job Title of the person'
      optional :email, type: String, desc: 'The Email Address of the person'
    end
    put do
      # fetch person record and update attributes.  exceptions caught in app.rb
      person = Person.find(params[:id])
      person.update_attributes!(permitted_params)
      represent person, with: PersonRepresenter
    end
  end
 end
 add_swagger_documentation api_version:'v0.1', mount_path: "/docs"
end
