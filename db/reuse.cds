namespace com.logaligroup;

using {
    cuid,
    managed,
    sap.common.CodeList
} from '@sap/cds/common';

aspect reuse : {};

entity DocumentTypes : cuid, reuse {
    documentType : String(80);
    code         : String(3);
};

entity Genders : cuid, reuse {
    gender : String(12);
    code   : String(4);
};

entity Countries : cuid {
    country     : String(80);
    code        : String(3);
    alpha2Code  : String(2);
    alpha3Code  : String(3);
    nationality : Association to Nationalities
                      on nationality.code = code;
};

entity Nationalities : cuid {
    key code        : String(10);
        description : String(100);
};

entity Status : CodeList {
    key code        : String enum {
            Active = 'Active'; //3
            Inactive = 'Inactive'; //1
            OnHold = 'On Hold'; //2
        };
        criticality : Int16; //color indicator
};

aspect Person : cuid, managed, reuse { // reusable aspect. not entity
    documentType   : Association to DocumentTypes;
    documentNumber : String(12);
    firstName      : String(20);
    secondname     : String(20);
    firstSurname   : String(20);
    secondSurname  : String(20);
    fullName       : String = (
        firstName || ' ' || secondname || ' ' || firstSurname || ' ' || secondSurname
    );
    gender         : Association to Genders;
    birthDate      : Date;
    birthPlace     : Association to Countries;
    nationality    : String(80);
    status         : Association to Status;
};

//labels for UI

annotate Person with {
    documentType @title: 'Document Type';
    documentNumber
                 @title: 'Document Number';
    firstName
                 @title: 'First Name';
    secondname
                 @title: 'Second Name';
    firstSurname
                 @title: 'First Surname';
    secondSurname
                 @title: 'Second Surname';
    fullName
                 @title: 'Full Name';
    gender
                 @title: 'Gender';
    birthDate
                 @title: 'Birth Date';
    birthPlace
                 @title: 'Birth Place';
    nationality
                 @title: 'Nationality';
    status
                 @title: 'Status';
}

annotate DocumentTypes with {
    @title : 'Document Types'
    ID @Common : { 
        Text : documentType,
        TextArrangement : #TextOnly
    }
};
