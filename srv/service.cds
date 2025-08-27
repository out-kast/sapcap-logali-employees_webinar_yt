using {com.logaligroup as entities} from '../db/schema';
using {com.logaligroup as reuse} from '../db/reuse';

@path: '/odata/v4/Employees/v1'
service EmployeesSet {

    entity EmployeesSet as projection on entities.Employees;

    /** Value Help */

    entity VH_DocumentTypes as projection on reuse.DocumentTypes;
    entity VH_Genders as projection on reuse.Genders;
    entity VH_Countries as projection on reuse.Countries;
    entity VH_Nationalities as projection on reuse.Nationalities;
    entity VH_Status as projection on reuse.Status;
}