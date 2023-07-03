DROP TABLE IF EXISTS events;

CREATE TABLE events (
    event_id INT GENERATED ALWAYS AS IDENTITY,
    event_name VARCHAR(100) NOT NULL,
    event_start_date DATE,
    event_start_time TIME,
    event_end_date DATE,
    event_end_time TIME,
    event_description VARCHAR(1000),
    location VARCHAR(100),
    category VARCHAR(100),
    organiser_id INT,
    -- approver_id INT,
    -- volunteer_id INT,
    participant_id INT,
    FOREIGN KEY(organiser_id) REFERENCES users(users_id),
    -- FOREIGN KEY(approver_id) REFERENCES admin(admin_id),
    -- FOREIGN KEY(volunteer_id) REFERENCES volunteer(volunteer_id),
    FOREIGN KEY(participant_id) REFERENCES users(users_id),
    PRIMARY KEY (event_id)
);

INSERT INTO
    events (
        event_name,
        event_start_date,
        event_start_time,
        event_end_date,
        event_end_time,
        event_description,
        location,
        category,
        organiser_id,
        -- approver_id,
        -- volunteer_id,
        participant_id
    )
VALUES
    ('Community Cleanup Day', '2023-07-15', '09:00:00', '2023-07-15', '12:00:00', 'Join us in cleaning up our neighborhood!', 'City Park', 'Community Service', NULL, NULL),
    ('Summer Concert in the Park', '2023-08-05', '18:30:00', '2023-08-05', '22:00:00', 'Enjoy live music performances in the park.', 'Central Park', 'Entertainment', NULL, NULL),
    ('Health and Wellness Workshop', '2023-09-10', '14:00:00', '2023-09-10', '16:00:00', 'Learn about maintaining a healthy lifestyle.', 'Community Center', 'Education', NULL, NULL),
    ('Family Fun Day', '2023-09-30', '10:00:00', '2023-09-30', '18:00:00', 'Bring your family for a day of games and activities.', 'Town Square', 'Family', NULL, NULL),
    ('Art Exhibition', '2023-10-20', '11:00:00', '2023-10-20', '16:00:00', 'Explore a diverse collection of local artwork.', 'Art Gallery', 'Arts & Culture', NULL, NULL),
    ('Outdoor Yoga Session', '2023-11-12', '09:30:00', '2023-11-12', '11:00:00', 'Rejuvenate your body and mind with a relaxing yoga session in nature.', 'Botanical Gardens', 'Health & Wellness', NULL, NULL),
    ('Food Festival', '2023-12-03', '16:00:00', '2023-12-03', '20:00:00', 'Indulge in a variety of delicious cuisines from local vendors.', 'Food Park', 'Culinary', NULL, NULL),
    ('Sports Tournament', '2023-12-15', '14:00:00', '2023-12-15', '18:00:00', 'Witness exciting matches as teams compete in various sports.', 'Sports Complex', 'Sports', NULL, NULL),
    ('Environmental Awareness Talk', '2023-07-25', '18:00:00', '2023-07-25', '20:00:00', 'Gain insights into environmental issues and learn how to make a positive impact.', 'Community Center', 'Education', NULL, NULL),
    ('Fashion Show', '2023-08-18', '19:00:00', '2023-08-18', '22:00:00', 'Experience a showcase of the latest fashion trends by local designers.', 'Event Hall', 'Fashion', NULL, NULL),
    ('Technology Expo', '2023-09-20', '10:00:00', '2023-09-20', '16:00:00', 'Discover cutting-edge technologies and innovations in various industries.', 'Convention Center', 'Technology', NULL, NULL),
    ('Pets Adoption Day', '2023-10-10', '11:00:00', '2023-10-10', '15:00:00', 'Find a loving home for adorable pets in need of adoption.', 'Animal Shelter', 'Community Service', NULL, NULL),
    ('Outdoor Film Screening', '2023-11-05', '18:30:00', '2023-11-05', '22:00:00', 'Enjoy a movie night under the stars with friends and family.', 'Park Amphitheater', 'Entertainment', NULL, NULL),
    ('Art Workshop', '2023-12-08', '13:30:00', '2023-12-08', '16:30:00', 'Unleash your creativity in a hands-on art workshop for all ages.', 'Art Studio', 'Arts & Culture', NULL, NULL),
    ('Fitness Bootcamp', '2023-07-28', '07:00:00', '2023-07-28', '09:00:00', 'Challenge yourself with a high-intensity workout session led by fitness experts.', 'Outdoor Park', 'Health & Wellness', NULL, NULL),
    ('Local Farmers Market', '2023-08-25', '09:00:00', '2023-08-25', '13:00:00', 'Support local farmers and explore a wide range of fresh produce.', 'Town Square', 'Food & Agriculture', NULL, NULL),
    ('Music Workshop', '2023-09-22', '15:00:00', '2023-09-22', '17:00:00', 'Learn the basics of playing a musical instrument in a fun and interactive workshop.', 'Music Academy', 'Arts & Culture', NULL, NULL),
    ('Charity Run', '2023-10-18', '08:00:00', '2023-10-18', '10:30:00', 'Participate in a charity run and contribute to a good cause.', 'Community Park', 'Community Service', NULL, NULL),
    ('Science Fair', '2023-11-15', '11:00:00', '2023-11-15', '15:00:00', 'Explore fascinating scientific experiments and projects by local students.', 'School Auditorium', 'Education', NULL, NULL),
    ('Gardening Workshop', '2023-12-12', '10:30:00', '2023-12-12', '12:30:00', 'Learn essential gardening techniques and tips for maintaining a beautiful garden.', 'Community Garden', 'Hobbies & Recreation', NULL, NULL);
