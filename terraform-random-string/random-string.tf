resource "random_string" "rand-string"{
   length = 5
   special = true
   override_special = "!@#$%^&*()"

}

output "rand-string"{
value = random_string.rand-string[*].result
}
