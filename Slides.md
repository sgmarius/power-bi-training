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
- Uses a module called `PowerQuery` meant to extract and transform data
- Accessible, yet customizable, through its syntax called `M`
- Offers a crude data storage solution

---


### How does `M` syntax look?

```

let
  Query = "SELECT * FROM Customers",
  Source = Sql.Database("server", "database", Query)
in
  Source

```

Looks sequential, but somewhat readable.

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
Similar to Excel formulae.

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

## Fitting

#### ![width:20px](./PowerBI-Icons/SVG/Dataflow.svg) Dataflows

Dataflows are making data available for the rest of the platform. They reside within workspaces, but can be accessed from outside their hosting workspace.

The output of a dataflow is one or more tables which are guaranteed to respect a format as described within their query.

Each table is expressed as a M query inside the Dataflow, this covering both the data extraction and transformation part.

---

## Fitting

#### ![width:20px](./PowerBI-Icons/SVG/Dataflow.svg) Dataflows

Data sources are automatically mapped, based on the queries (or tables) featured, and they require credential management.

What's upstream of a dataflow:
- Can be consumed by Semantic Models. 
- ![width:40px](./PowerBI-Icons/SVG/Premium.svg) ![width:40px](./PowerBI-Icons/SVG/Premium-Per-User.svg) Other Dataflows can also be based of dataflows.

---

## Fitting

#### ![width:20px](./PowerBI-Icons/SVG/Dataflow.svg) Dataflows - Exercise: adding a table

- Go to your assigned workspace and open the `Customer` dataflow by clicking on its title.
- In the upper right corner, click on `Edit tables`
- In the upper left corner, click on `Get data`
- In the pop-up's search box, search for `PostgreSQL`
- From the pop-up's search results, click on `PostgreSQL database`

---

## Fitting

#### ![width:20px](./PowerBI-Icons/SVG/Dataflow.svg) Dataflows - Exercise: adding a table

Fill in the details as follows:
- Server: `aws-0-eu-central-1.pooler.supabase.com`
- Database: `postgres`
- Username: `To be provided during training session`
- Password: `To be provided during training session`
- Privacy Level to None
- Use encrypted connection unchecked

---

## Fitting

#### ![width:20px](./PowerBI-Icons/SVG/Dataflow.svg) Dataflows - Exercise: adding a table

  - Click `Next` in the lower right corner
  - Notice that how a set of credentials is created for this data source
  - Search for `user_typology` and check the `public.user_typology` table.
  - Notice right the hand side pane displaying a preview of the data.

---

## Fitting

#### ![width:20px](./PowerBI-Icons/SVG/Dataflow.svg) Dataflows - Exercise: adding a table
  - Click `Create` in the lower right corner
  - Notice that name of newly created query
  - Notice the `Applied steps` section
  - Right click on the `public user_typollogy` query and select `Advanced editor`.
  - Notice the `M` code associated with this query and how it translates to the steps featured in the `Applied steps` section.

<!-- Renaming the query; Making it somewhat match something in the Users query-->