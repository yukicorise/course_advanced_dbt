## Task 2
I've added docs blocks for source and core models. In future work, we could make this more comprehensive by adding model descriptions in addition to field descriptions, and adding docs blocks for intermediate models as well. 

Please note: when I added new documentation yml files as a part of Task 3, I did not create comprehensive docs here (which I would do with more time!)

## Task 3
- fct_events did not have a yml file, so I created a placeholder (I didn't fill this out completely, which I would need to do in the real world.)
- mrr model was not pre-pended with dim_ or fct_. In reality, the MRR model is not either a dimension or a fact. I added a new naming convention for rpt_ for reporting models in the dbt_project.yml file
- dim_dates uses dbt_utils to create a date spine, and is missing a source model. I think we can ignore this, although I couldn't figure out how to add this to the exceptions seed file.
- lastly, rpt_mrr was identified as in the wrong folder. I think this may be because I created a new prefix for rpt_. I'd like to figure out how to add that to the exception as well, but I wouldn't move this to a different directory - it belongs in finance.