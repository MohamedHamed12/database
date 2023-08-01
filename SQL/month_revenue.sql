select
    d.id,
    sum(
        case
            when d.month = 'Jan' then d.revenue
            else 0
        end
    ) Jan_Revenue,
    sum(
        case
            when d.month = 'Feb' then d.revenue
            else 0
        end
    ) Feb_Revenue,
    sum(
        case
            when d.month = 'Mar' then d.revenue
            else 0
        end
    ) Mar_Revenue,
    sum(
        case
            when d.month = 'Apr' then d.revenue
            else 0
        end
    ) Apr_Revenue,
    sum(
        case
            when d.month = 'May' then d.revenue
            else 0
        end
    ) May_Revenue,
    sum(
        case
            when d.month = 'Jun' then d.revenue
            else 0
        end
    ) Jun_Revenue,
    sum(
        case
            when d.month = 'Jul' then d.revenue
            else 0
        end
    ) Jul_Revenue,
    sum(
        case
            when d.month = 'Aug' then d.revenue
            else 0
        end
    ) Aug_Revenue,
    sum(
        case
            when d.month = 'Sep' then d.revenue
            else 0
        end
    ) Sep_Revenue,
    sum(
        case
            when d.month = 'Oct' then d.revenue
            else 0
        end
    ) Oct_Revenue,
    sum(
        case
            when d.month = 'Nov' then d.revenue
            else 0
        end
    ) Nov_Revenue,
    sum(
        case
            when d.month = 'Dec' then d.revenue
            else 0
        end
    ) Dec_Revenue
from
    Department d
group by
    d.id