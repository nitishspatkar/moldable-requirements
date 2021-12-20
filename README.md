### Step 1

Download and open the latest image of the Glamorous toolkit from [their official homepage](https://gtoolkit.com/).
Open a **Playground** and execute the following script.

``` 
Metacello new
    baseline: 'MyMoldableRequirements';
    repository: 'github://nitishspatkar/moldable-requirements:scheduling’;
    load 
```
### Step 2:

To verify the average number of lines of code to define a view in an image: open a **Playground** and execute 
```
#gtView gtPragmas.
```
 
The returned object has a “**Metrics**” view that shows the average number of lines of code of view methods.

### Step 3

To explore the requirements created in an IDE as user stories, follow these steps:
There are two ways to run that example:

* **Alternative 1**:
Open another **Playground** and type: 
```
MyProject
``` 
and click on the inspect button.  
An object inspector window will open.   
Navigate to the tab “**Examples map**” and run the example:
```
gtParseJSONExample
```

* **Alternative 2**:
type:
``` 
gtParseJSONExample
``` 
in **Spotter** and run the example from there.

This would load a list of four sample projects, the last being “**Hospital management system**.”   
When you double-click on it, it will open corresponding epics.  
When you double-click one of the epics, it should open corresponding user stories. 
Click on different tabs, such as 'Minimal' or 'Story card', to see various representations of a specific user story.


### Step 4:

To explore the implementation of the scheduling application: 
Open another **Playground** and type: 
```
HMHospitalManagementSystemExamples
``` 
and click on the inspect button.  
An object inspector window will open.
Click on **Browse class** button and then you can explore the entire implementation of the scheduling application. 

### Step 5:
To explore the example documentation:
From the **Home** menu of the Glamorous Toolkit, click on Lepiter.
It will open a bunch of existing live documents.
To load documents specific to our schedduling application:
Scroll down on Lepiter page, where you will find a button **Add new database**. Click on that.
Tell the Glamorous Toolkit where to find the existing database by providing a path.
Your path should looks something like: 
```
<<the current Glamorous toolkiit folder>>/pharo-local/iceberg/<<GitHub username>>/moldable-requirements
```

When you navigatee to this path, you will see in a list a folder **lepiterdb**.
Select that folder and click on **Add database**.
This should load all the existing live documents.
Now, navigate back to **Home** screeen of the Glamorous Toolkit. On the top, you should see a tile called **Hospital Management System**. 
You can explore the documentation by clicking on the tile.

### Step 6

To verify Invoicing examples: kindly type brows the class "**RMInvoice**" and navigate to the tab "**Parameterized examples**".
Click on "**Order item with price and tax**".
After filling all the required details, kindly click "**Run**".

Click on "**Create an invoice with order items with regular or reduced tax rates**".
After filling all the required details, kindly click "**Run**".

Navigate to the tab "**Path**" from the previous step.



