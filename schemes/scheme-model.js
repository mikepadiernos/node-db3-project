const db = require("../data/db-config.js");

module.exports = {
	find,
	findById,
	findSteps,
	add,
	update,
	remove
};

function find() {
	return db('schemes');
}

function findById(id) {
	return db('schemes')
		.where({ id })
		.first();
}

//? GET
function findSteps(id) {
	return db
		.select(
			'steps.id',
			'schemes.scheme_name',
			'steps.step_number',
			'steps.instructions',
		)
		.from('steps')
		.join('schemes', 'steps.scheme_id', 'schemes.id')
		.where('steps.scheme_id', id)
		.orderBy('steps.step_number');
}

// POST
function add(schemeData) {
	return db('schemes')
		.insert(schemeData);
}

// PUT
function update(changes, id) {
	return db("schemes")
		.where({ id })
		.update(changes)
		.then(ids => {
			return findById(id);
		});
}

// DELETE
function remove(id) {
	return db('schemes')
		.where({ id })
		.delete();
}













