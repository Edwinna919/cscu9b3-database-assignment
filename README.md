\# CSCU9B3 Database Assignment



Student ID: 202516802215

Module: Database Principles and Applications

Scenario: Art Exhibition Management



This repository contains the ERD, SQL scripts, and report drafts for the assignment.



Resolving Many-to-Many Relationships：

In the conceptual model, 'Artwork' and 'Exhibition' have a Many-to-Many (M:M) relationship. One artwork can be shown in multiple exhibitions, and one exhibition can contain multiple artworks. 



To implement this in a relational database, this M:M relationship must be resolved. We created the associative entity 'Exhibition\_Artwork' to bridge them. This breaks the M:M relationship into two 1:M relationships:

\- One 'Exhibition' has many 'Exhibition\_Artwork' records.

\- One 'Artwork' has many 'Exhibition\_Artwork' records.



This design also allows us to store attributes specific to the relationship, such as 'loan\_fee' and 'insurance\_value'.

