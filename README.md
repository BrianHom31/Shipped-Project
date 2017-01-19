
# Shipped

---


**Goal:**

To become familiar with building a full featured Rails Application utilizing **complex model associations, model validations, paperclip and devise.**


---


**Associations**

Create a Rails application for shippers to help them organize all of the ships in their fleet!

Three entities:
- Companies (Devise, Paperclip for avatars)
- Boats (Paperclip for avatars)
- Jobs

**Companies:**
- Companies have many boats
- Companies can create new boats

**Boats:**
- A boat belongs to a company
- A boat can be assigned to many jobs
- Boats have:  
  * Name
  * Amount of containers it's able to ship
  * Location (stored as a string)

**Jobs:**
- A job has many boats
- Jobs have:
  * Name
  * Description
  * Origin (stored as a string)
  * Destination (stored as a string)
  * Cost
  * Amount of containers needed for job




---


**Validations:**

Once you have the basics setup, add some validations:

**Boats:**
  * Must have a unique `name`
  * `Locations` must be pulled from a valid list of locations (use a hard-coded list in radio buttons or a dropdown)

**Jobs:**
  * Must have a unique `name`
  * `Cost` must be above $1000 for each job
  * `Description` must be at least 50 characters
  * `Origin` and `destinations` must be pulled from a valid list of locations (use a hard-coded list)


---


**BONUS**

Use Rails UJS on the Jobs Show page to enable the user to add a boat to a job without reloading the page.


---


**Views**

You may create whatever views you'd like. However, you must have these:

**Company Show Page:**
- The company's info
- A list of the boats that the company owns


**Job Show Page**
- The job's info
- A list of the boats assigned to that job
- **Bonus:** A list of boats with either an "add to job" or "remove" link next to it that will add/remove the job using UJS.
