
  create view "main"."teams__dbt_tmp" as (
    





SELECT
    S.visitorneutral AS team_long,
    R.team

FROM "main"."main"."raw_schedule" AS S

    LEFT JOIN "main"."main"."ratings" R ON R.team_long = S.visitorneutral
GROUP BY ALL
  );
