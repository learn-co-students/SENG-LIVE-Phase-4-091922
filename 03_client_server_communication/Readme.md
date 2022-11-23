# Client Server Communication
## SWBATs:
- [ ] Observe how to connect a React client and API
- [ ] Observe how to create a new instance from client
- [ ] Observe how to fetch data from client
- [ ] Observe how to use built-in and custom Active Record validations to protect data in controller actions
- [ ] Observe how to handle errors in controller actions
- [ ] Observe fetching from client to show route and displaying a show page
- [ ] Observe sending a PATCH request from React client
- [ ] Observe sending a DELETE request from React client

## deliverables
- Demo client-server communication 
    - Review the client folder, and the application built so far.
    -  Review the package.json and the proxy for "http://localhost:3000"

    - In the App component, in the useEffect hook, add a GET request to '/productions' that will set productions to state if the request is returned successfully.

    - Add a debugging tool to the production controller's index action to confirm that the fetch call triggers the controller action.

- Demo error handling for GET requests

    - Review res.ok https://developer.mozilla.org/en-US/docs/Web/API/Response/ok

    - Add some error handling for an unsuccessful response. Refactor the fetch request to verify that the response has returned successfully before setting the state. 
    ```
    if(res.ok){
            res.json().then(setProductions)
        }
    ```
    - Add errors to state  `const [errors, setErrors] = useState(false)`

    - Add a conditional above the return statement. If errors, render an h1 containing the errors `if(errors) return <h1>{errors}</h1>`

    - Add an else to the res.ok if statement that will set the errors to state if the response returns unsuccessfully.
    ```
    else {
            res.json().then(data => setErrors(data.error))
        }

    ```

    - Test the else condition by commenting out the index route in routes.rb to force the client to throw an error. 

    - In the ProductionDetail component, make a GET request to '/productions/:id'

    - Following the same pattern from APP, set the Production to state if the request is successful and set the errors if the request fails. Add a conditional to render errors if they exist.

    - Test the else condition by commenting out the show route in routes.rb to force the client to throw an error. 

- Demo Validations 
    - Review the rails validation docs https://guides.rubyonrails.org/active_record_validations.html

    - Add a few validations, such as validating the presence of title and that the budget is greater than 0.

    - Bonus: add a custom validation

- Demo handling invalid records 

    - In the Production, controller handle validation in 3 ways. 
    
    1. .valid
        - In the create action, add a condition after Production.create. If  `production.valid?` send the Production in a response with the created status. Else send the errors with Production.errors.full_messages and a status of unprocessable_entity.
    
        - Use postman to verify the validation.
    
    2. rescue 
        - Review exceptions https://ruby-doc.org/core-2.6/Exception.html

        - Add a ! to create to raise an exception.

        - Send the Production in a response with the status of create 

        - Add a rescue that will trigger if an exception is raised.

        - Test the rescue with Postman and use a debugging tool to dig into the invalid to view the errors. 
        ```
        rescue ActiveRecord::RecordInvalid => invalid
            render json: { errors: invalid.record.errors }, status: :unprocessable_entity
        ```
    3. rescue_from
        - Create a private method called render_unprocessable_entity with the parameter of invalid that will create a response with errors and a status of unprocessable_entity
        ```
            def render_unprocessable_entity(invalid)
                render json: {errors: invalid.record.errors}, status: :unprocessable_entity
            end
	    ```
        - Add a rescue_from to the top of the controller that will trigger on a RecordInvalid exception and invoke render_unprocessable_entity
        ```
            rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
        ```
- Demo Post
    - In the client, under the ProductionForm component, create a POST request on submit that sends a production to '/productions'

    - Use a conditional with res.ok. If the response is successful set productions to state and use history.push to direct to the show route of the new production. 
    - Else set errors to state. 

    - Handling InvalidRecord errors will be a little different due to the number of errors that are returned with the failed validations. Set the errors so that they include the attribute and the error message. 
    
    - Add a condition under the form; if errors, map through the errors in state and render them in JSX. These errors will inform the Users that their submission failed and why.
    
    - Test the validations and error handling using the form
    
- Demo PATCH
    - In the EditProductionForm component, add a PATCH request  '/productions/:id’ on submit. Add the same error handling from ProductionForm to the  EditProductionForm component.

    - To test these errors, and an exception will need to be raised from the request. 
    - In the Production controller, under the update action add ! to update. This will cause it to raise a RecordInvalid exception. 

    - An update request may raise another kind of exception if the record can not be located. Producion.find raises a RecordNotFound exception. 

    - Add a new rescue_from at the top of the controller that will invoke a method called `render_not_found` that takes an error as a parameter and will send a response with the not found error. 

    ```
        rescue_from ActiveRecord::RecordNotFound, with: :render_not_found


        def render_not_found(error)
            render json: {errors: {error.model => "Not Found"}}, status: :not_found
        end
    ```
    - Test the validations and error handling using the form

- Demo Delete
    - In the ProductionDetail component, add a delete request on click of the delete button to  '/productions/:id’. Create a condition with res.ok. If the request is successfully removed the production from state and use history.push to direct to the home route.

    - Else set errors to state and render them. 




Images:
landingPageImage
https://unsplash.com/photos/POd35V_uE4k
Published on February 16, 2018
Free to use under the Unsplash License
Dancer: Olivia Tarchick