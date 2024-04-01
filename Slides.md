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

## What is Power BI?

Power BI is a platform that facilitates end to end data works:
 - Extraction
 - Transformation
 - Storage - but with a very limited capability
 - Visualization
 - _"Packaging"_

---

## Positioning
<script type="module">
    import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs';
    $(document).ready(function () {
        mermaid.initialize();
    });
</script>

<div class="mermaid">
flowchart LR
subgraph wsp1["Workspace 1"]
    direction LR
    wsp1_data_source1["Data source 1"]-->wsp1_dataflow1["Dataflow 1"]
    wsp1_data_source2["Data source 2"]-->wsp1_dataflow1["Dataflow 1"]
    wsp1_dataflow1["Dataflow"]-->wsp1_dataset["Dataset"]
    wsp1_dataset-->wsp1_report["Report"]
    wsp1_report-->wsp1_dashboard["Dashboard"]
    wsp1_report-->wsp1_app["App"]
    wsp1_dashboard-->wsp1_app["App"]
end

subgraph wsp2["Workspace 2"]
    direction LR
    wsp2_data_source["Data Source"]-->wsp2_dataflow["Dataflow"]
    wsp1_dataflow1--"Premium required"-->wsp2_dataflow["Dataflow"]
    wsp2_dataflow-->wsp2_dataset["Dataset"]
    wsp1_dataset-->wsp2_dataset["Dataset"]
    wsp2_dataset-->wsp2_report["Report"]
    wsp2_report-->wsp2_app["App"]
end
</div>
<div class="mermaid">
flowchart TB

	%% Colors %%
		linkStyle default stroke-width:3px
		classDef white fill:white,stroke:#000,stroke-width:2px,color:#000
		classDef yellow fill:#fffd75,stroke:#000,stroke-width:2px,color:#000
		classDef green fill:#93ff75,stroke:#000,stroke-width:2px,color:#000
	
	%% Databases %%
		DOCS("<img src='https://super.so/icon/dark/file-minus.svg'; width='40' />"):::white
		NOTES("<img src='https://super.so/icon/dark/book.svg'; width='40' />"):::white
		TASKS("<img src='https://super.so/icon/dark/check-square.svg'; width='40' />"):::white

	%% Documents Database %%

		DOCS ---- DOCTYPE("<img src='https://super.so/icon/dark/chevron-down.svg'; width='25' /> Type"):::yellow
		DOCS ---- DOCCREATEDBY("<img src='https://super.so/icon/dark/user.svg'; width='25' /> Created By"):::yellow

			%% Documents to Tasks %%
	
				DOCS --- DOCTASKS("<img src='https://super.so/icon/dark/arrow-up-right.svg'; width='25' /> Tasks"):::green
				DOCTASKS --- TASKS

			%% Documents to Notes %%

				DOCS --- DOCNOTE("<img src='https://super.so/icon/dark/arrow-up-right.svg'; width='25' /> Notes"):::green
				DOCNOTE --- NOTES

		DOCS ---- DOCSTATUS("<img src='https://super.so/icon/dark/chevron-down.svg'; width='25' /> Status"):::yellow
		DOCS ---- DOCCREATEDTIME("<img src='https://super.so/icon/dark/clock.svg'; width='25' /> Created Time"):::yellow

	%% Links %%
		click DOCS "https://redgregory.notion.site/c154907e263f48fe979a792588f3875a?v=2aabab98f87f479da4b9a66d86d61b50"
		click NOTES "https://redgregory.notion.site/89bb914e098041e2bee59b8f3aa09e73?v=9d216b2217c041d3a16c9460062847f2"
		click TASKS "https://redgregory.notion.site/82b9e09f12b747f4b92604598d38084b?v=3b53f53088f344d99bda1e2682e52f54"
	
</div>