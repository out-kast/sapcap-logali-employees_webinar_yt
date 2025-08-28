using {com.logaligroup as entities} from '../db/schema';
using {com.logaligroup as reuse} from '../db/reuse';

@path: '/odata/v4/Employees/v1'
service Employees {

    entity EmployeesSet     as projection on entities.Employees;

    /** Value Help */
    @readonly
    entity VH_DocumentTypes as projection on reuse.DocumentTypes;

    @readonly
    entity VH_Genders       as projection on reuse.Genders;

    @readonly
    entity VH_Countries     as
        projection on reuse.Countries {
            *,
            //nationality.description as nationality
        };

    @readonly
    entity VH_Nationalities as projection on reuse.Nationalities;

    @readonly
    entity VH_Status        as projection on reuse.Status;
}
