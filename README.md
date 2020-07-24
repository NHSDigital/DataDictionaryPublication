# Data dictionary publication tooling version 4
This repository hosts the code for creating a publication of the NHS Data Model and Dictionary from the Mauro Model Catalogue.
## Status
* The output publication is at alpha status.  
* The underpinning model is based on the model used to create the NHS Data Model and Dictionary https://datadictionary.nhs.uk
## Approach
To support a the federated production and governance of the data architecture, each source will be transposed into a common intermediate representation using the [Darwin Information Typing Architecture (DITA)](https://docs.oasis-open.org/dita/dita/v1.3/dita-v1.3-part0-overview.html).  Each component  will be labelled with metadata to enable reuse and automated inclusion or exclusion in publications for specific purposes.  With this approach, the data architecture can be assembled into reusable modules and these modules can in turn be gathered for specific uses.

The publications can be as documents, websites, e-books in various formats and help files.  Branding for these publications can be appropriate to the particular publisher.  For a Data Provision Notice specifying the form and manner of a collection served by NHS Digital, it would be NHS Digital branded.  For an Information Standard published by Secretary of State the Department of Health’s branding can be used instead at trivial additional cost.
## Core tools
* Mauro Data Mapper - an open source model catalogue initiated by the Big Data Institute, Oxford University
