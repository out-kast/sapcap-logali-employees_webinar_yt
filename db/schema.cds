namespace com.logaligroup;

using {
    com.logaligroup.Person
} from './reuse';


entity Employees : Person {};// extend Person aspect into entity
//entity student : Person {}; // another example for entity reusing Person
