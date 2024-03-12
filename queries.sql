-- Join the two tables so that every column and record appears, regardless of if there is not an owner_id .

SELECT *
    FROM owners o
    FULL JOIN vehicles v
    ON o.id = v.owner_id;

-- Count the number of cars for each owner. Display the owners first_name , last_name and count of vehicles. The first_name should be ordered in ascending order.

SELECT first_name, last_name, COUNT(*) AS count
    FROM owners o
    RIGHT JOIN vehicles v -- RIGHT JOIN because we may want to include people with no cars.
    ON o.id = v.owner_id
    GROUP BY o.id
    ORDER BY first_name;

-- Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name , last_name, average price and count of vehicles. The first_name should be ordered in descending order. Only display results with more than one vehicle and an average price greater than 10000.

SELECT first_name, last_name, ROUND(AVG(price)) AS average_price, COUNT(*) AS count
    FROM owners o
    JOIN vehicles v
    ON o.id = v.owner_id
    GROUP BY o.id
    HAVING ROUND(AVG(price)) > 10000
    ORDER BY first_name DESC;
