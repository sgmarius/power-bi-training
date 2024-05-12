---
marp: true
theme: gaia
_class: lead
paginate: true
backgroundColor: #fff
backgroundImage: url('https://marp.app/assets/hero-background.svg')
---

# Introduction to the Power BI platform

A hands on session to get acustomed with Power BI componentry and their interaction.

![bg right:40% 50%](./PowerBI-Icons/SVG/Power-BI.svg) 
![bg :40% 50%](./PowerBI-Icons/SVG/Power-Query-Colored.svg) 
![bg :40% 50%](./PowerBI-Icons/SVG/Dataflow.svg) 
![bg :40% 50%](./PowerBI-Icons/SVG/Dataset.svg)
![bg :40% 50%](./PowerBI-Icons/SVG/Report.svg) 
![bg :40% 50%](./PowerBI-Icons/SVG/Dashboard.svg) 

---

## What?

Power BI is a platform that facilitates end to end data works:
 - Extraction
 - Transformation
 - Storage - but with a very limited capability
 - Visualization
 - _"Packaging"_

 ---

## Where?

The most common version of Power BI is the cloud one, known as the `Power BI Service`. For clients that prefer on premise techology, there's [`Power BI Report Server`](https://learn.microsoft.com/en-us/power-bi/report-server/get-started), this however is found rarely in the wild and because of that it will not be covered in this training.

 ---

## Why?

It's the BI tool that seems to offer the best bang for the buck:
- Complete data operations toolkit
- Mature APIs for customized interactions
- Constantly updated on a monthly basis

---

## Licensing

The most important difference is around Pro versus Premium features. Whenever we'll refer to something as being available only for Premium we'll do so by adding a  ![width:40px](./PowerBI-Icons/SVG/Premium.svg) or ![width:40px](./PowerBI-Icons/SVG/Premium-Per-User.svg).

---

## Platform componentry

The Power BI platform consists of multiple components that cover specific functionalities. Some of the functionalities are shared in between components and that might confuse, but I asure it will all make sense.

We will not go into the more recent componentry (Goals, Streaming Dataflows, Scorecards etc.) since they are derived from more _"mature"_ and popular components, which this training will cover in the next slides.

---

### ![width:40px](./PowerBI-Icons/SVG/Dataflow.svg) Dataflows
- Developed only in the `Power BI Service`
- Uses a module called `Power Query` meant to extract and transform data
- Accessible, yet customizable, through its syntax called `M`
- Offers a crude data storage solution

---


### How does `M` syntax look?

```
let
  Source = PostgreSQL.Database("aws-0-eu-central-1.pooler.supabase.com", "postgres"),
  #"Navigation 1" = Source{[Schema = "POWER_QUERY_EXERCISES", Item = "EXERCISE_TABLE__SCHEMA_CHANGES"]}[Data],
  #"Unpivoted other columns" = Table.UnpivotOtherColumns(#"Navigation 1", {"ID"}, "Attribute", "Value")
in
  #"Unpivoted other columns"

```

We'll go in depth about this syntax in the Dataflows section.

---

### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models
- Development must start locally, using `Power BI Desktop`, but may be continued in the `Power BI Service`
- They use the same `PowerQuery` module used within *Dataflows* to extract, transform and load data
- A fully fledged `OLAP database` receives the data and can be further transformed using a syntax called `DAX` (among others)
- Used to be officially called `Datasets` and might still be refered to as such, some folk may also call it a `Cube`

---

### How does `DAX` syntax look?

```

Yearly Avg =
AVERAGEX (
  VALUES ( 'Date'[Calendar Year] ),
  CALCULATE (
    SUMX ( Sales, Sales[Quantity] * Sales[Net Price] )
  )
)

```
Similar to Excel formulae, since it was made accessible via Excel some 15 years ago. We'll go deeper into DAX in the Semantic Model section.

---

### ![width:40px](./PowerBI-Icons/SVG/Report.svg) Reports
- Development can be done in both `Power BI Desktop` and `Service`
- Queries and displays data from the `Semantic models` in interactive visuals
- Offers an extensive visual collection
- It may be packed with a `Semantic model` when serialized as a `.pbix`
- It is considered a standalone component in the `Power BI Service`

---

### ![width:40px](./PowerBI-Icons/SVG/Dashboard.svg) Dashboards
- Developed only in the `Power BI Service`
- Allows featuring of visuals from multiple reports
- Less popular, since it acts like a hub which facilitates navigation to other reports
- More potent when it comes to streaming data

---

### ![width:40px](./PowerBI-Icons/SVG/Workspace.svg) Workspaces
- Managed only in the `Power BI Service`
- Groups Power BI content and allows most importantly, access management


---

### ![width:40px](./PowerBI-Icons/SVG/App.svg) Apps
- Developed only in the `Power BI Service`
- Packages reports and dashboards in a single component, facilitating navigation
- One per workspace

---
The next sections we'll blend theory with exercises. We'll start with the Dataflow.

This is a component some of you might be familiar with since it is present within PowerApps as well.

---
#### ![width:20px](./PowerBI-Icons/SVG/Dataflow.svg) Dataflows

Dataflows are making data available for the rest of the platform. They reside within workspaces, but can be accessed from outside their hosting workspace.

The output of a dataflow is one or more tables which are guaranteed to respect a format as described within their query.

Each table is expressed as a `M` query inside the Dataflow, this covering both the data extraction and transformation part.

---

#### ![width:20px](./PowerBI-Icons/SVG/Dataflow.svg) Dataflows

The same PowerQuery engine is also used by the semantic models when extracting a loading data in their tabular database, hence a lot of the knowledge will carry over.

Dataflows are primarily an accessibility tool, in the sense that they make data available in a single point in an agreed upon format.

The data present can get refreshed programatically, or on a schedule from the setting screen with a frequency of either 8 or 48 times per day.

---
#### ![width:20px](./PowerBI-Icons/SVG/Dataflow.svg) Dataflows

Data sources are automatically mapped, based on the queries (or tables) featured, and they require some credential management.

Each dataflow is managed and developed by an Owner.

What's upstream of a dataflow:
- Can be consumed by Semantic Models. 
- ![width:40px](./PowerBI-Icons/SVG/Premium.svg) ![width:40px](./PowerBI-Icons/SVG/Premium-Per-User.svg) Dataflows can also be based of other dataflows.

---
#### ![width:20px](./PowerBI-Icons/SVG/Dataflow.svg) Dataflows

More about dataflows:
- https://learn.microsoft.com/en-us/power-bi/transform-model/dataflows/dataflows-introduction-self-service
- https://learn.microsoft.com/en-us/power-apps/maker/data-platform/self-service-data-prep-with-dataflows

---

### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

The component you'll probably spend the most time with:
- Extracts, transforms and loads data with a Power Query module of its own (third time it's been mentioned...)
- Models data allowing for a wider variety than Power Query of transformation and behaviours
- Offers data access control both at a row and object level
- Enables data analysis through DAX

---
### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **ETL**
Like stated 4 times already, it uses Power Query. The module used in this case allows for some control over parallelism in data loading and is not locking features behind Premium/Premium-per-User.

Unlike Dataflows, which load data in the CSV format behind the scenes, in this case the data is loaded into an SQL Server Analysis Services local server running in Tabular mode.

---
### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **ETL**
Each M query that's load enabled in the Power Query module will create and feed data to a table within the SSAS cube.

SSAS is more restrictive when it comes to data structure hence Power Query will not load columns which feature types `Record`, `List`, `Table` or `Error` as there's no equivalent within SSAS.

---
### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **ETL**
We call the extract, transform and load cycle within a semantic model a `data refresh`. This can be triggered manually, or automatically either based off a schedule:
- Up to 8 times a day for shared capacities
- ![width:40px](./PowerBI-Icons/SVG/Premium.svg) ![width:40px](./PowerBI-Icons/SVG/Premium-Per-User.svg) Up to 48 times a day

Refreshes can also be triggered by using the Power BI administrative API.

---
### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **Data Modelling**
SSAS Tabular is a column oriented in-memory database, hence all the nice compression and speed of processing. The data stored cannot be updated, only deleted and rewritten and because of this, most of the modelling is done by creating artifacts based on existing data.

The starting point when it comes to modelling is the `column`, which has some properties of interest.

---
### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **Data Modelling**
The starting point when it comes to modelling is the `column`, which has some properties of interest:
- Name - self explanatory
- Data type - can vary between `Text`, `Integer`, `Decimal`, `DateTime` etc
- Format string - it's a mask tied to the data type. For example we may store a column as Decimal, but choose to only display the first 3 decimals. These work the same as in Excel
---
### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **Data Modelling**
Columns are then grouped in tables. A table also has some properties worth mentioning:
- Name
- Date table annotation - will describe this more in the exercises

---
### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **Data Modelling**
Should two tables be related, this can be expressed using one or more relationships. A relationship is set between two columns from different tables. They describe how filters emited from certain tables affect the model.

Between two table there can only be one active relationship, but multiple inactive can be created.

Relationships take into account cardinality of columns, aka `one to many`, `one to one` and `many to many`

---
### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **Data Modelling**
All of the artifacts described thusfar are used within measures, which are refering to columns or tables in order to calculate some sort of statistic at the most basic level, or provide formatting masks at the more advanced level. Much like columns measures have:
- Name
- Data Type
- Formatting string
- `DAX` expression

---
### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **Data Modelling**
You'll find in Power BI that the most interactive way of calculation is offered via measures, since they reschuffle existing data at query time.

---
### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **Data Modelling**
Generally, when describing modelling we are talking about:
- Managing column/table aliases and data types
- Managing `relationships` between tables
- Creating and maintaining query/processing time `calculated tables`
- Creating and maintaining query/processing time `calculated columns`
- Creating and maintaining `measures`

---
### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **Data Modelling**

While `relationships` can be created and modified through GUI tools like Power BI Desktop, Visual Studio or Tabular Editor, `calculated tables/columns` and `measures` are created using a special syntax called `DAX` (data analysis expressions).

At first glance, `DAX` looks very similar to Excel formulae but has a more broad approach when refering to data, replacing range references of cells to tables, columns or measures.

---
### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **Security**

Row level security (also known in other systems as RBAC) is also described using `DAX`. RLS works by creating Roles, which target tables within the model, filtering them using a `DAX` expression.

The role can be impersonated in tools like Power BI Desktop / Service or DAX Studio and can be tested/developed as such.

---

### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

More about semantic models:
- https://learn.microsoft.com/en-us/power-bi/connect-data/service-datasets-understand
- https://learn.microsoft.com/en-us/training/modules/design-model-power-bi/
- https://blog.tabulareditor.com/2023/11/17/semantic-models-in-simple-terms/

---
### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **DAX**

The bane of every Power BI developer standing at the `PEAK OF 'MT. STUPID'`
![width:540px](https://onlinepethealth.com/wp-content/uploads/2022/11/Dunning-Kruger-Graph-2-004.jpg)

---
### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **DAX**
Like shown already, it is a syntax similar to excel formulae also overlapping some of the terms and how they behave.

The most abstract concept that is hard to understand by young developers is the evaluation context. We will go through the main ones: the filtering and the row context.

Much like the M syntax, we'll showcase more of `DAX` through exercises.

---

### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **DAX**

More about DAX:
- https://learn.microsoft.com/en-us/power-bi/transform-model/desktop-quickstart-learn-dax-basics
- https://www.daxpatterns.com/patterns/
- https://dax.do
- https://dax.guide

---

### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **Intermission**: Evaluation contexts

- When evaluated, measures in DAX are submitted to a certain context. This can look like a particular year on the X-Axis of a visual, or the row of a table. Our expectation is that whatever the measure will output, it should be in conformity with the value it associates to in the visual
- This however is just the most obvious context, some more filters can also be emitted by other visuals, while some other can be emitted by the `Filtering pane`

---
### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **Intermission**: Evaluation contexts

- This being said, we call the `filtering context` the cummulative of "filters" that a DAX expression is subjected to, in a visual or query.
- We're going to count relationships also filters to have that definition make sense.
- The context can be altered in the said expression: it can be ignored, or overwritten all together.

---
### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **Intermission**: Evaluation contexts

- When developing measures, you'll notice that you cannot directly offer a column. i.e.:

```
Measure = 'Table'[Column]
```
However a calculated column allows for this sort of notation (effectively copying the values from `'Table'[Column]`). This is because the expression used for the column is going to be evaluated for each row in the hosting table. This behaviour is known as the `row context`


---
### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **Intermission**: Evaluation contexts

- Measures need to return a scalar data type, and this sort of notation will yield an error since it returns a column all together (since measures are not evaluated in a row context)

---

### ![width:40px](./PowerBI-Icons/SVG/Dataset.svg) Semantic models

##### **Intermission**: Evaluation contexts

More information about evaluation contexts:
- https://www.sqlbi.com/articles/row-context-in-dax/
- https://www.sqlbi.com/articles/filter-context-in-dax/

---

### ![width:40px](./PowerBI-Icons/SVG/Report.svg) Reports

The cornerstone of the visual componentry in Power BI it allows for querying data and representing it in a visual manner.

The basis here is the visual, which takes columns and measures as input, mashes them and displays them.

Visuals have a lot of properties with regards to styling, allowing for custom colours, fonts and labels.

---

### ![width:40px](./PowerBI-Icons/SVG/Report.svg) Reports

Visuals are then contained in Pages. Each page has its type, size and its own styling properties.

A filtering pane is present on each page that displays the filters applied at the visual, page or report level.

---

### ![width:40px](./PowerBI-Icons/SVG/Report.svg) Reports

More information about reports:
- https://learn.microsoft.com/en-us/power-bi/consumer/end-user-reports
- https://learn.microsoft.com/en-us/power-bi/visuals/power-bi-visualization-types-for-reports-and-q-and-a
- https://learn.microsoft.com/en-us/power-bi/create-reports/


---
### ![width:40px](./PowerBI-Icons/SVG/Dashboard.svg) Dashboards

These can only be created in the Power BI Service and are based of content from existing reports and can also feature some static visual pieces (such as text boxes, images or iframes for web pages or videos).

A visual from a report can be pinned to one or multiple dashboards, given that both the report and dashboard(s) are on the same workspace.

---

### ![width:40px](./PowerBI-Icons/SVG/Dashboard.svg) Dashboards

A dashboard visual is less interactive than a report visual, the only action availble is clicking on it which engages some sort of navigation either to:
- An external URL
- An existing report or dashboard (default behaviour for pinned visuals from reports)

---

### ![width:40px](./PowerBI-Icons/SVG/Dashboard.svg) Dashboards

When a visual from a report is being pinned, the state of it is also persisted - this means that whatever filters are affecting the said visual are going to be preserved in the dashboard pin.

The value of the visual however is not being freezed, and the dashboard can be forced to retrieve a newer value using the refresh button in the upper right corner.

---

### ![width:40px](./PowerBI-Icons/SVG/Dashboard.svg) Dashboards

Should you ever play with streaming semantic models (which are a bit more programmatic in nature) you'll notice that a dashboard automatically refreshes itself whenever new rows are pushed to the underlying semantic model.

A report containing the same visual componentry is not able to do this, always requiring some sort of a filtering context change to retrigger queries and retrieve new data.

---

### ![width:40px](./PowerBI-Icons/SVG/Dashboard.svg) Dashboards

More information about dashboards:
- https://learn.microsoft.com/en-us/power-bi/create-reports/service-dashboards
- https://learn.microsoft.com/en-us/power-bi/consumer/end-user-dashboards

---

### ![width:40px](./PowerBI-Icons/SVG/App.svg) Apps

A packaging method for all the visual content in a workspace. Once packaged (or published) the App can be shared easier towards an audience. The App will also simplify navigation throught content through usage of a navigation pane in the left edge of the screen.

A special type of App exists called the Template App, which allows packaging parameterized Power BI content and that upon installation requires filling it the required paramteres to function proper.

---

 ### ![width:40px](./PowerBI-Icons/SVG/App.svg) Apps

More information about Apps:
- https://learn.microsoft.com/en-us/power-bi/connect-data/service-template-apps-overview
- https://learn.microsoft.com/en-us/power-bi/collaborate-share/service-create-distribute-apps
- https://learn.microsoft.com/en-us/power-bi/collaborate-share/service-create-the-new-workspaces

---

End of slides - Thank you!