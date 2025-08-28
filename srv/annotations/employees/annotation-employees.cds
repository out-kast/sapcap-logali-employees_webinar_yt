using {Employees as views} from '../../service';

annotate views.EmployeesSet with @odata.draft.enabled; // enable draft - MODO BORRADOR

annotate views.EmployeesSet with {
    documentType @Common: {
        Text           : documentType.documentType,
        TextArrangement: #TextOnly,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'VH_DocumentTypes',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: 'documentType_ID',
                    ValueListProperty: 'ID'
                },
            ]
        },
    }
};


annotate views.EmployeesSet with @(
    UI.HeaderInfo                     : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Employee',
        TypeNamePlural: 'Employees',
        Title         : {
            $Type: 'UI.DataField',
            Value: fullName,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: documentNumber,
        }
    },
    UI.LineItem                       : [
        {
            $Type: 'UI.DataField',
            Value: documentType_ID
        },
        {
            $Type: 'UI.DataField',
            Value: documentNumber
        },
        {
            $Type: 'UI.DataField',
            Value: firstName
        },
        {
            $Type: 'UI.DataField',
            Value: secondname
        },
        {
            $Type: 'UI.DataField',
            Value: firstSurname
        },
        {
            $Type: 'UI.DataField',
            Value: secondSurname
        },
        {
            $Type: 'UI.DataField',
            Value: gender_description
        },
        {
            $Type: 'UI.DataField',
            Value: birthDate
        },
        {
            $Type: 'UI.DataField',
            Value: birthPlace_ID
        },
        {
            $Type: 'UI.DataField',
            Value: nationality
        },
        {
            $Type: 'UI.DataField',
            Value: status_code
        }
    ],
    UI.FieldGroup #PersonalInformation: {
        $Type: 'UI.FieldGroupType',
        Label: 'Personal Information',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: documentType_ID
            },
            {
                $Type: 'UI.DataField',
                Value: documentNumber
            },
            {
                $Type: 'UI.DataField',
                Value: firstName
            },
            {
                $Type: 'UI.DataField',
                Value: secondname
            },
            {
                $Type: 'UI.DataField',
                Value: firstSurname
            },
            {
                $Type: 'UI.DataField',
                Value: secondSurname
            },
            {
                $Type: 'UI.DataField',
                Value: gender_ID
            },
            {
                $Type: 'UI.DataField',
                Value: birthDate
            },
            {
                $Type: 'UI.DataField',
                Value: birthPlace_ID
            },
            {
                $Type: 'UI.DataField',
                Value: nationality
            },
            {
                $Type: 'UI.DataField',
                Value: status_code
            },
        ],
    },
    UI.Facets                         : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Personal Information',
        Target: '@UI.FieldGroup#PersonalInformation'
    }]
);
