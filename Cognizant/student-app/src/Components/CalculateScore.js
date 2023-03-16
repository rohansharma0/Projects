import React from "react";

const CalculateScore = ({ name, school, total, goal }) => {
	const percentToDecimal = (decimal) => {
		return decimal.toFixed(2) + "%";
	};
	const calcScore = (total, goal) => {
		return percentToDecimal(total / goal);
	};

	return (
		<div className="formatStyle">
			<h1>
				<font color="Brown">Student Details:</font>
			</h1>
			<div className="name">
				<b>
					<span>Name: </span>
				</b>
				<span>{name}</span>
			</div>
			<div className="school">
				<b>
					<span>School: </span>
				</b>
				<span>{school}</span>
			</div>
			<div className="total">
				<b>
					<span>Total: </span>
				</b>
				<span>{total}</span>
				<span>Marks</span>
			</div>
			<div className="score">
				<b>Score:</b>
				<span>{calcScore(total, goal)}</span>
			</div>
		</div>
	);
};

export default CalculateScore;
