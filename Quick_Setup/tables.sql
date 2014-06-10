CREATE TABLE hitdb (hitId VARCHAR(100), date DATE, requesterName VARCHAR(100), requesterId VARCHAR(50), title VARCHAR(200), reward FLOAT, status VARCHAR(100), feedback VARCHAR(200), workerId VARCHAR(50));

ALTER TABLE hitdb ADD PRIMARY KEY (hitId);

CREATE TABLE workerdb (workerId VARCHAR(50), workerName VARCHAR(50), bonus FLOAT, transfer FLOAT);

ALTER TABLE workerdb ADD PRIMARY KEY (workerId);
