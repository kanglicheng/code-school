require 'rspec'
require 'rails_helper'
require 'spec_helper'

require_relative '../movie_buff/03_queries.rb'

describe "starring(whazzername)" do
	let (:lester) { starring("lester stone") }
	let (:me) { starring("me book") }
	let (:ery) { starring("ery steep") }
	it "retrieves the correct information" do
		expect(lester).to contain_exactly(*Actor.find_by(name: "Sylvester Stallone").movies)
		expect(me).to contain_exactly(*Actor.find_by(name: "Mel Brooks").movies)
		expect(ery).to contain_exactly(*Actor.find_by(name: "Meryl Streep").movies)
	end

	it "hits the database exactly once" do
		expect{ lester.as_json }.to make_database_queries(count: 1)
		expect{ me.as_json }.to make_database_queries(count: 1)
		expect{ ery.as_json }.to make_database_queries(count: 1)
	end

end

describe "bad_years" do
	subject { bad_years }

	it "retrieves the correct information" do
		expect(subject).to contain_exactly(1947, 1932, 1965)
	end

  it "hits the database exactly once" do
    expect{ subject.as_json }.to make_database_queries(count: 1)
  end

end

describe "golden_age" do
	subject { golden_age }
	it "retrieves the correct information" do
		expect(subject).to be(1920)
	end

	 it "hits the database exactly once" do
    expect{ subject }.to make_database_queries(count: 1)
  end
end

describe "costars" do
	let (:julie_andrews) { costars("Julie Andrews").to_a }
	let (:humphrey_bogart) { costars("Humphrey Bogart").to_a }
	it "retrieves the correct information" do
		expect(julie_andrews).to contain_exactly(
			"Bo Derek",
			"Peter Arne",
			"Richard Haydn",
			"Peggy Wood",
			"Graham Stark",
			"Dee Wallace-Stone",
			"Alex Karras",
			"Ben Wright (I)",
			"Eleanor Parker (I)",
			"Robert Preston (I)",
			"James Garner",
			"Brian Dennehy",
			"Dudley Moore",
			"Sam J. Jones",
			"Don Calfa",
			"Deborah Rush",
			"Lesley Ann Warren",
			"John Rhys-Davies",
			"Robert Webber (I)",
			"Christopher Plummer"
		)
		expect(humphrey_bogart).to contain_exactly(
			"Barton MacLane",
			"Bruce Bennett",
			"Claude Akins",
			"Claude Rains",
			"Conrad Veidt",
			"Curt Bois",
			"Dolores Moran",
			"Dorothy Malone",
			"E.G. Marshall",
			"Elisha Cook Jr.",
			"Fred MacMurray",
			"Hoagy Carmichael",
			"Ingrid Bergman",
			"Jerry Paris",
			"John Qualen",
			"John Ridgely",
			"Jos&#233; Ferrer",
			"Katharine Hepburn",
			"Lauren Bacall",
			"Lee Marvin",
			"Madeleine LeBeau",
			"Martha Vickers",
			"Paul Henreid",
			"Peter Bull (I)",
			"Peter Lorre",
			"Regis Toomey",
			"Robert Francis (I)",
			"Robert Morley (I)",
			"Theodore Bikel",
			"Tim Holt",
			"Van Johnson",
			"Walter Brennan",
			"Walter Gotell",
			"Walter Huston"
		)
	end

	it "hits the database at most twice" do
    expect{ julie_andrews }.to make_database_queries(count: 1..2)
    expect{ humphrey_bogart }.to make_database_queries(count: 1..2)
  end
end

describe "actor_out_of_work" do
	subject { actor_out_of_work }
	it "retrieves the correct information" do
		expect(subject).to eq(770)
	end

	it "hits the database exactly once" do
		expect{ subject }.to make_database_queries(count: 1)
	end
end

describe "longest_career" do
	subject { longest_career.as_json }
	it "retrieves the correct information" do
		expect(subject).to eq([
			{"id"=>3537, "name"=>"Deems Taylor", "career"=>59},
			{"id"=>1915, "name"=>"Leopold Stokowski", "career"=>59},
			{"id"=>845, "name"=>"Robert Stack", "career"=>56}
		])
	end

	it "hits the database exactly once" do
		expect{ subject }.to make_database_queries(count: 1)
	end
end


