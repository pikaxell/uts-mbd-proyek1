SET search_path TO SALAM;


-- INSERT DATA DOSEN

INSERT INTO SALAM.dosen (nidn, nama_dosen, email_dosen) VALUES
('0415088901', 'Dr. Ir. Ahmad Fauzi, M.T.', 'ahmad.fauzi@salam.ac.id'),
('0422118502', 'Siti Nurhaliza, S.T., M.Kom.', 'siti.nurhaliza@salam.ac.id'),
('0410039003', 'Budi Santoso, Ph.D.', 'budi.santoso@salam.ac.id');


-- INSERT DATA RUANG KELAS

INSERT INTO SALAM.ruang_kelas (kode_ruang, kapasitas) VALUES
('LAB-01', 30),
('RK-201', 40),
('RK-202', 40);


-- INSERT DATA MATA KULIAH

INSERT INTO SALAM.mata_kuliah (kode_mk, nama_mk, sks) VALUES
('IF101', 'Manajemen Basis Data', 3),
('IF102', 'Pemrograman Berorientasi Objek', 3),
('IF103', 'Struktur Data dan Algoritma', 4),
('IF104', 'Jaringan Komputer', 3);


-- INSERT DATA JADWAL KULIAH

INSERT INTO SALAM.jadwal (kode_mk, nidn, kode_ruang, hari, jam_mulai, jam_selesai, kelas) VALUES
('IF101', '0415088901', 'LAB-01', 'Senin', '08:00:00', '10:30:00', 'A'),
('IF101', '0415088901', 'LAB-01', 'Senin', '10:30:00', '13:00:00', 'B'),
('IF102', '0422118502', 'RK-201', 'Selasa', '09:00:00', '11:30:00', 'A'),
('IF103', '0410039003', 'RK-202', 'Rabu', '08:00:00', '11:20:00', 'A'),
('IF104', '0422118502', 'LAB-01', 'Kamis', '13:00:00', '15:30:00', 'A');


-- INSERT DATA MAHASISWAS (Uji Berbagai Level IPK)

INSERT INTO SALAM.mahasiswas (nim, nama, email, ipk, dosen_wali_nidn) VALUES
('1247050064', 'Ferdinan Mahrus', 'ferdinan@student.salam.ac.id', 3.92, '0415088901'),
('1247050002', 'Rizky Pratama', 'rizky.p@student.salam.ac.id', 3.65, '0415088901'),
('1247050003', 'Anisa Rahmawati', 'anisa.r@student.salam.ac.id', 3.25, '0422118502'),
('1247050004', 'Dewa Budjana', 'dewa.b@student.salam.ac.id', 2.85, '0410039003'),
('1247050005', 'Eko Prasetyo', 'eko.p@student.salam.ac.id', 2.40, '0410039003');


-- INSERT DATA KRS (Transaksi Pengambilan Matkul)

INSERT INTO SALAM.krs (nim, id_jadwal, semester) VALUES
('1247050064', 1, 'Ganjil 2026'),
('1247050064', 3, 'Ganjil 2026'),
('1247050064', 4, 'Ganjil 2026'),
('1247050002', 2, 'Ganjil 2026'),
('1247050002', 5, 'Ganjil 2026'),
('1247050003', 1, 'Ganjil 2026'),
('1247050004', 3, 'Ganjil 2026'),
('1247050005', 4, 'Ganjil 2026');