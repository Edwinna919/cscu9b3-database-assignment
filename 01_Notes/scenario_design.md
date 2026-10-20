\# Scenario Design: Art Exhibition Management



\## 1. Entities and Attributes



\### Artist

\- artist\_id (Primary Key)

\- artist\_name (VARCHAR)

\- birth\_year (INT)

\- nationality (VARCHAR)



\### Artwork

\- artwork\_id (Primary Key)

\- title (VARCHAR)

\- creation\_year (INT)

\- medium (VARCHAR)

\- artist\_id (Foreign Key to Artist)



\### Exhibition

\- exhibition\_id (Primary Key)

\- exhibition\_name (VARCHAR)

\- start\_date (DATE)

\- end\_date (DATE)

\- venue (VARCHAR)



\### Exhibition\_Artwork (Associative Entity)

\- exhibition\_id (Foreign Key to Exhibition, part of Composite PK)

\- artwork\_id (Foreign Key to Artwork, part of Composite PK)

\- loan\_fee (DECIMAL)

\- insurance\_value (DECIMAL)



\## 2. Relationships



\- Artist 1:M Artwork

&#x20; One artist can create many artworks, and each artwork is created by one artist.



\- Exhibition 1:M Exhibition\_Artwork

&#x20; One exhibition can include many artworks, and each exhibition record belongs to one exhibition.



\- Artwork 1:M Exhibition\_Artwork

&#x20; One artwork can be included in many exhibition records, and each exhibition record refers to one artwork.



\- Artwork M:M Exhibition

&#x20; One artwork can be displayed in many exhibitions, and one exhibition can display many artworks. This M:M relationship is resolved by the associative entity Exhibition\_Artwork.



\## 3. Normalisation and Anomalies Discussion



Our database design follows the Third Normal Form (3NF) to ensure data integrity and prevent anomalies.



\### First Normal Form (1NF)

All entities contain atomic values (no repeating groups or multi-valued attributes). For example, an exhibition is held at a single venue, and a loan fee is a single decimal value.



\### Second Normal Form (2NF)

To achieve 2NF, all non-key attributes must be fully functionally dependent on the entire primary key. The `Exhibition\_Artwork` table has a composite primary key `(exhibition\_id, artwork\_id)`. The attributes `loan\_fee` and `insurance\_value` depend on both the specific exhibition and the specific artwork, thus satisfying 2NF. All other tables use single-column primary keys.



\### Third Normal Form (3NF)

We eliminate transitive dependencies to achieve 3NF. All non-key attributes depend directly on the primary key. For example, `artist\_name` depends directly on `artist\_id` and is stored in the `Artist` table, not repeated in the `Artwork` table.



\### Anomalies Prevented by Our Design

By normalising our tables, we prevent several data anomalies:

\- \*\*Insertion Anomaly:\*\* If we stored all information in one large table, we could not add a new artwork to our database until it was assigned to an exhibition (because `exhibition\_id` is part of the primary key and cannot be NULL). By separating `Artwork` and `Exhibition\_Artwork`, we can insert a new artwork independently of any exhibition.

\- \*\*Update Anomaly:\*\* If an artist changes their nationality, we only update one row in the `Artist` table. We do not have to worry about updating multiple rows and causing inconsistencies.

\- \*\*Deletion Anomaly:\*\* If an exhibition is cancelled and we delete it from the `Exhibition` table, we do not lose the information about the artists or their artworks, as they are stored in separate, independent tables.

