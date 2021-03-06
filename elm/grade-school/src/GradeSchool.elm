module GradeSchool exposing (addStudent, allStudents, empty, studentsInGrade)

import Dict exposing (Dict)


type alias Grade =
    Int


type alias Student =
    String


type alias School =
    Dict Grade (List Student)


empty : School
empty =
    Dict.empty


addStudent : Grade -> Student -> School -> School
addStudent grade student school =
    Dict.update grade
        (\value ->
            case value of
                Just students ->
                    (student :: students)
                        |> List.sort
                        |> Just

                Nothing ->
                    Just [ student ]
        )
        school


studentsInGrade : Grade -> School -> List Student
studentsInGrade grade school =
    case Dict.get grade school of
        Just students ->
            students

        Nothing ->
            []


allStudents : School -> List ( Grade, List Student )
allStudents school =
    Dict.toList school
