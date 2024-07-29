


```bash
    CREATE TABLE students (
      id SERIAL PRIMARY KEY,
      name TEXT NOT NULL CHECK (name ~ '^[A-Za-z ]+$'), -- Only allows letters and spaces
      dob DATE NOT NULL,
      email TEXT NOT NULL CHECK (email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$'), -- Basic email format check
      phone TEXT NOT NULL CHECK (phone ~ '^[0-9]+$') -- Only allows digits
  );
```