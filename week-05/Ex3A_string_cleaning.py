name_1 = "PRIYA SHARMA"
name_2 = "bob NGUYEN"
name_3 = "LaTonya Williams"
salary_1 = "$82,500"
salary_2 = "$74,000"

# Using lowercase
print(name_1.lower())
print(name_2.lower())
print(name_3.lower())

#  Using title case
print(name_1.title())
print(name_2.title())
print(name_3.title())

#
salary_1_clean = salary_1.replace("$", "")
salary_2_clean = salary_2.replace("$", "")
print(salary_1_clean)
print(salary_2_clean)
print(type(salary_1_clean))