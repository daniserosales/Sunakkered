const db = require('../database/connect')

class Event {
    constructor({
        event_id, event_name, event_start_date, event_start_time, event_end_date, event_end_time,
        event_description, location, category, organiser_id, approver_id, volunteer_id, partcipant_id
    }) {
        this.event_id = event_id
        this.event_name = event_name
        this.event_start_date = event_start_date
        this.event_start_time = event_start_time
        this.event_end_date = event_end_date
        this.event_end_time = event_end_time
        this.event_description = event_description
        this.location = location
        this.category = category
        this.organiser_id = organiser_id
        this.approver_id = approver_id
        this.volunteer_id = volunteer_id
        this.partcipant_id = partcipant_id
    }

    static async getAll() {
        const response = await db.query("SELECT * FROM events");
        if (response.rows.length === 0) {
            throw new Error("No event available.")
        }
        return response.rows.map(e => new Event(e))

    }

    static async getOneByEventId(id) {
        const response = await db.query("SELECT * FROM events WHERE event_id = $1;", [id]);
        if (response.rows.length != 1) {
            throw new Error("Unable to find event.")
        }
        return new Country(response.rows[0]);
    }

    static async getEventsByKeyword(keyword) {
        const response = await db.query("SELECT * FROM events WHERE event_name LIKE '%$1%' OR event_name LIKE '%$2%' OR event_name LIKE '%$3%'", [keyword, keyword, keyword]);
        if (response.rows.length < 1) {
            throw new Error("No event found.")
        }
        return response.rows.map(e => new Event(e))
    }

    static async getEventsByDate(startDate, endDate) {
        const response = await db.query("SELECT * FROM events WHERE event_start_date BETWEEN $1 AND $2", [startDate, endDate]);
        if (response.rows.length < 1) {
            throw new Error("No event found.")
        }
        return response.rows.map(e => new Event(e))
    }

    static async create(data) {
        const { event_name, event_start_date, event_start_time, event_end_date, event_end_time, event_description, location = NULL, category = NULL, organiser_id = NULL, partcipant_id = NULL } = data;
        const response = await db.query("INSERT INTO events (event_name, event_start_date, event_start_time, event_end_date, event_end_time, event_description, location, category, organiser_id, partcipant_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING *;", [event_name, event_start_date, event_start_time, event_end_date, event_end_time, event_description, location, category, organiser_id, partcipant_id])
        const eventID = response.rows[0].event_id;
        const newEvent = await Event.getOneByEventId(eventID)
        return newEvent;
    }

    async update(data) {
        const { event_id, event_name, event_start_date, event_start_time, event_end_date, event_end_time, event_description, location = NULL, category = NULL, organiser_id = NULL, participant_id = NULL } = data;
        const response = await db.query(
            "UPDATE events SET event_name = $1, event_start_date = $2, event_start_time = $3, event_end_date = $4, event_end_time = $5, event_description = $6, location = $7, category = $8, organiser_id = $9, participant_id = $10 WHERE id = $11 RETURNING *;",
            [event_name, event_start_date, event_start_time, event_end_date, event_end_time, event_description, location, category, organiser_id, participant_id, event_id]
        );
        const eventID = response.rows[0].event_id;
        const newEvent = await Event.getOneByEventId(eventID)
        return newEvent;
    }

    async destroy() {
        const response = await db.query('DELETE FROM events WHERE event_id = $1 RETURNING *;', [this.id]);
        if (response.rows.length != 1) {
            throw new Error("Unable to delete event.")
        }
        return new Event(response.rows[0]);
    }
}


module.exports = Event;