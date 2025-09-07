drop table if exists "Wallet";
drop table if exists "Transfer_Log";

create table "Wallet" (
    student_id int primary key,
    balance numeric
);

insert into "Wallet"(student_id, balance) values
(1, 1000),
(2, 500),
(3, 200);

create table "Transfer_Log" (
    id serial primary key,
    from_id int,
    to_id int,
    amount numeric,
    status varchar(50),
    log_time timestamp default current_timestamp
);

create or replace procedure transfer_wallet(from_id int, to_id int, amount numeric)
language plpgsql
as $$
declare
    from_balance numeric;
begin
    select balance into from_balance
    from "Wallet"
    where student_id = from_id;

    if from_balance < amount then
        insert into "Transfer_Log"(from_id, to_id, amount, status)
        values (from_id, to_id, amount, 'INSUFFICIENT_FUNDS');

        raise notice 'Insufficient funds: %. Transfer aborted.', amount;

    else
        update "Wallet"
        set balance = balance - amount
        where student_id = from_id;

        update "Wallet"
        set balance = balance + amount
        where student_id = to_id;

        insert into "Transfer_Log"(from_id, to_id, amount, status)
        values (from_id, to_id, amount, 'OK');

        raise notice 'Transfer of % from % to % completed successfully.', amount, from_id, to_id;
    end if;
end;
$$;

call transfer_wallet(1, 2, 200);
call transfer_wallet(3, 2, 500);

select * from "Wallet";

select * from "Transfer_Log";
