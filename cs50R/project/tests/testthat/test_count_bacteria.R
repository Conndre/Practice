
describe("count_bacteria()", {
  it("should return a data.frame with species and counts", {
    result <- count_bacteria()
    expect_equal(ncol(result), 2)  # Should have two columns
    expect_true("Species" %in% colnames(result))  # Should contain 'Species'
    expect_true("Count" %in% colnames(result))  # Should contain 'Count'
  })
})
