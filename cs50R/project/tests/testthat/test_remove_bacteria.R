
describe("remove_bacteria()", {
  it("should remove the correct number of bacteria from a species, not going below zero", {
    bacteria_data <- count_bacteria()
    updated_data <- remove_bacteria("Lactobacillus", 200, bacteria_data)
    expect_equal(updated_data$Count[updated_data$Species == "Lactobacillus"], 1000)

    # Test removing more than available (should not go below zero)
    updated_data <- remove_bacteria("Bacteroides", 400, bacteria_data)
    expect_equal(updated_data$Count[updated_data$Species == "Bacteroides"], 0)
  })
})
