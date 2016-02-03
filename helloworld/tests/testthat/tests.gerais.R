library(helloworld)

context("Soma")

test_that("testando se a soma esta correta", {
  expect_equal(soma(c(1,2,3)), 6)
})
