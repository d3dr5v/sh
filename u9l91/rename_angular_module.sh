#!/bin/bash


mv personal user-dashboard
cd user-dashboard






find . -type f -exec sed -i '' 's/personal-/user-dashboard-/g' {} +



find . -depth -type d -name '*personal*' | while read dir; do
  parent=$(dirname "$dir")
  newdir=$(basename "$dir" | sed 's/personal/user-dashboard/g')
  mv "$dir" "$parent/$newdir"
done



find . -type f -exec sed -i '' 's/Personal/UserDashboard/g' {} +



find . -type f -name '*personal*' | while read file; do
    dir=$(dirname "$file")
    newfile=$(basename "$file" | sed 's/personal/user-dashboard/g')
    mv "$file" "$dir/$newfile"
done




find . -type f -exec sed -i '' 's/personal\([A-Z]\)/userDashboard\1/g' {} +



find . -type f -exec sed -i '' 's/personal/user-dashboard/g' {} +





