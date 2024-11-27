document.addEventListener('DOMContentLoaded', () => {
    console.log("DOM vollständig geladen");

//get all available categories from database
    fetch('/get_categories')
    .then(response => {
        console.log("got response");
        return response.json();
    })
    .then(data => {
        console.log("data fetched:", data);
        if (data.error) {
            console.error("ERROR while loading categories", data.error);
            alert("Could not load categories.");
        } else {
            const categorySelect = document.getElementById("category");
            categorySelect.innerHTML = '<option value="" disabled selected>Select a category</option>';
            data.forEach(category => {
                const option = document.createElement("option");
                option.value = category.id;
                option.textContent = category.name;
                categorySelect.appendChild(option);
                console.log("category added:", category.name);
            });
        }
    })
    .catch(error => {
        console.error("ERROR while loading categories:", error);
        alert("could not load categories.");
    });

//submit filled out form -> send it to database
    function submitForm(event) {
        event.preventDefault();
        console.log("form sent");

        const title = document.getElementById("title").value;
        const content = document.getElementById("content").value;
        const orga_id = document.getElementById("orga_id").value;
        const category = document.getElementById("category").value;

        console.log("form data:", { title, content, orga_id, category });

        if (!title || !content || !orga_id || !category) {
            alert("field missing");
            console.error("field missing:", { title, content, orga_id, category });
            return;
        }

        const postData = {
            title: title,
            content: content,
            orga_id: orga_id,
            category: category
        };

        fetch('/create_event', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(postData)
        })
        .then(response => response.json())
        .then(data => {
            console.log("response from server:", data);
            if (data.message) {
                alert(data.message);
                //TODO change later
                window.location.href = "/";
            } else {
                alert("ERROR: " + data.error);
            }
        })
        .catch((error) => {
            console.error("ERROR while creating post:", error);
            alert("error occurred while creating the post");
        });
    }

    const form = document.querySelector('form');
    form.addEventListener('submit', submitForm);
    console.log("form event listener added");

});
