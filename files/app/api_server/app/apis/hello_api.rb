class HelloApi < Grape::API

  resource :hello do
    desc 'Return a Hello World message'
    get do
      { message: 'Hello Wonderful World, from Mcappface!' }
    end
  end
  add_swagger_documentation
end
