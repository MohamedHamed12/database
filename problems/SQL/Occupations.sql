select
    max(
        case
            when occupation = 'Doctor' then name
            else null
        end
    ),
    max(
        case
            when occupation = 'Professor' then name
            else null
        end
    ),
    max(
        case
            when occupation = 'Singer' then name
            else null
        end
    ),
    max(
        case
            when occupation = 'Actor' then name
            else null
        end
    )
from
    (
        select
            occupation,
            name,
            row_number() over (
                partition by occupation
                order by
                    name
            ) as rawn
        from
            occupations
    ) as pn
group by
    rawn;