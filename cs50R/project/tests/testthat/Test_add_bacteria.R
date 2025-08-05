
describe("add_bacteria()", {
  it("should add the correct number of bacteria to a species", {
    bacteria_data <- count_bacteria()
    updated_data <- add_bacteria("Escherichia coli", 100, bacteria_data)
    expect_equal(updated_data$Count[updated_data$Species == "Escherichia coli"], 600)
  })
})

