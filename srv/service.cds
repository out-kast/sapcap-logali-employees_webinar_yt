using {com.logaligroup as entities} from '../db/schema';

@path: '/odata/v4/Employees/v1'
service EmployeesSet {

    entity EmployeesSet as projection on entities.Employees;

}