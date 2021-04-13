## Prerequisite

Kindly install Glamorous Toolkit by following the instrctions from [https://gtoolkit.com/](their%20homepage)

# Exploring the sample solution

## The requirements hierarchy

Start the Glamorous Toolkit IDE and open a playground.
Run the follwong script to load the necessary packages.
```
Metacello new
  baseline: 'MyMoldableRequirements';
  repository: 'github://nitishspatkar/moldable-requirements:main';
  load
```

In another playground window type in `MyProject` and inspect the results.
Navigate to `Example map` tab, hover over of the only example `gtParseJSONExample` and click on `Play and Inspect Example Result`.
It should open another inspector wondow that displays two sample projects, i.e., `Address Book Application` and `Restaurant Application`.

Clicking on one of the projects will open another inspector window for a specific `MyProject` object.
The first tab `Epics` lists all the epics in this projects.
Cliking on a specific epic will open corresponding user stories, and clicking on a specific user story will open corresponding scenarios.

Note that, in each inspector window there are several tabs that show various views on a specific object. 
For instance, the rae tab, which is the default tab, in `MyProject` inspector window shows raw details of a specific `MyProject` object. 
The `Meta` tab, among other details, such as related examples, lists all the methods of the `MyProject` class.

## The scenarios

Open another playground, type in `requirementContainerWithThreeEpics`, and press CMD +M to explore all the implmentors of this method.
Open the `Live` tab In the opened object inspector and click on `Play and Inspect Example Result`.
It will open another similar requirements hierachy but in a tree representation. 
Open the user story `As a user, I want to add contact` from the second epic `Manage address book`.
Click on the `Scenarios` tab and then on `Add new contact` scenario.
This should open an object inspector for `EScenario` object.
Navigate to `Parametrized example` tab and click on `Add given contact to to an address book`.
It should open an interface where the user can select the combinations of contact and address books to generate new examples. 
Clicking on the `Run` button returns the resulting address book, whereas clicking on the `Generate` button will generate the corresponding example method.
