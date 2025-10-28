1.	Model (ToDo)
	•	Berisi struktur data satu tugas (id, title, dan isDone).
	•	isDone menyimpan status apakah tugas sudah selesai.

2.	Provider / ViewModel (ToDoListModel)
	•	Menyimpan semua daftar ToDo dalam _todos.
	•	Memiliki method:
	•	addTask(title) → menambah tugas baru.
	•	toggleTask(id) → mengubah status selesai/tidak.
	•	deleteTask(id) → menghapus tugas.
	•	Memanggil notifyListeners() supaya UI otomatis diperbarui.

3.	View / UI
	•	ToDoPage → halaman utama, menampilkan:
	•	Input untuk menambah tugas (_AddTaskInput)
	•	Daftar tugas (_ToDoList)
	•	_ToDoList → menampilkan semua ToDo menggunakan ListView.builder.
	•	_ToDoItem → tampilan satu item tugas, ada checkbox dan tombol hapus.
