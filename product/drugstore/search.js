document.addEventListener("DOMContentLoaded", function () {
  const searchInput = document.getElementById("search");
  const suggestionsBox = document.getElementById("suggestions");
  const searchResults = document.getElementById("searchResults");
  const searchForm = document.getElementById("searchForm");
  const searchButton = document.getElementById("searchButton");


  searchInput.addEventListener("keyup", function (event) {
      let query = searchInput.value.trim();

      if (query.length === 0) {
          suggestionsBox.innerHTML = "";
          return;
      }

      fetch(`search_suggestions.php?query=${encodeURIComponent(query)}`)
          .then(response => response.json())
          .then(data => {
              suggestionsBox.innerHTML = "";
              if (data.length > 0) {
                  let list = document.createElement("ul");
                  list.className = "suggestions-list";
                  data.forEach(item => {
                      let suggestionItem = document.createElement("li");
                      suggestionItem.className = "suggestion-item";
                      suggestionItem.textContent = item.name;
                      suggestionItem.onclick = function () {
                       
                          searchInput.value = item.name;
                          suggestionsBox.innerHTML = "";
                      };
                      list.appendChild(suggestionItem);
                  });
                  suggestionsBox.appendChild(list);
              }
          })
          .catch(error => console.error("Lỗi tìm kiếm:", error));
  });

 
  document.addEventListener("click", function (event) {
      if (!searchInput.contains(event.target) && !suggestionsBox.contains(event.target)) {
          suggestionsBox.innerHTML = "";
      }
  });

  
  function fetchSingleProduct() {
      let query = searchInput.value.trim();
      if (query.length === 0) {
          searchResults.innerHTML = "<p>Vui lòng nhập từ khóa!</p>";
          return;
      }

      fetch(`search_suggestions.php?query=${encodeURIComponent(query)}`)
          .then(response => response.json())
          .then(data => {
              searchResults.innerHTML = ""; 
              if (data.length > 0) {
                  let item = data[0]; 
                  searchResults.innerHTML = `
                      <div class="product-card">
                          <img src="${item.image_url}" alt="${item.name}" width="100">
                          <p><strong>${item.name}</strong></p>
                          <p>💰 Giá: ${item.price.toLocaleString()} VNĐ</p>
                          <a href="product-detail.php?id=${item.id}" class="btn btn-info">🔎 Xem chi tiết</a>
                      </div>
                  `;
              } else {
                  searchResults.innerHTML = "<p>Không tìm thấy kết quả.</p>";
              }
          })
          .catch(error => console.error("Lỗi tìm kiếm:", error));
  }

  
  searchInput.addEventListener("keyup", function (event) {
      if (event.key === "Enter") {
          event.preventDefault();
          fetchSingleProduct();
      }
  });


  searchButton.addEventListener("click", function () {
      fetchSingleProduct();
  });
});
