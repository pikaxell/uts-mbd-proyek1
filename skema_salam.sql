CREATE SCHEMA SALAM;


-- TABEL MASTER (Dosen, Mata Kuliah, Ruang Kelas)

CREATE TABLE SALAM.dosen (
    nidn VARCHAR(20) PRIMARY KEY,
    nama_dosen VARCHAR(100) NOT NULL,
    email_dosen VARCHAR(100) UNIQUE
);

CREATE TABLE SALAM.ruang_kelas (
    kode_ruang VARCHAR(10) PRIMARY KEY,
    kapasitas INT CHECK (kapasitas > 0)
);

CREATE TABLE SALAM.mata_kuliah (
    kode_mk VARCHAR(15) PRIMARY KEY,
    nama_mk VARCHAR(100) NOT NULL,
    sks INT CHECK (sks BETWEEN 1 AND 6)
);


-- TABEL JADWAL KULIAH

CREATE TABLE SALAM.jadwal (
    id_jadwal SERIAL PRIMARY KEY,
    kode_mk VARCHAR(15) REFERENCES SALAM.mata_kuliah(kode_mk) ON DELETE CASCADE,
    nidn VARCHAR(20) REFERENCES SALAM.dosen(nidn) ON DELETE SET NULL,
    kode_ruang VARCHAR(10) REFERENCES SALAM.ruang_kelas(kode_ruang) ON DELETE RESTRICT,
    hari VARCHAR(15) NOT NULL,
    jam_mulai TIME NOT NULL,
    jam_selesai TIME NOT NULL,
    kelas VARCHAR(5) NOT NULL
);


-- TABEL MAHASISWAS (Dengan Detail Predikat Akademik)

CREATE TABLE SALAM.mahasiswas (
    nim VARCHAR(10) PRIMARY KEY,                            -- Primary Key
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,                              -- Unique Constraint
    ipk NUMERIC(3,2) CHECK (ipk >= 0.00 AND ipk <= 4.00),   -- Check Constraint
    dosen_wali_nidn VARCHAR(20) REFERENCES SALAM.dosen(nidn) ON DELETE SET NULL,
    
    -- FITUR PEMBEDA: Generated Column dengan pesan status
    predikat_akademik VARCHAR(80) GENERATED ALWAYS AS (
        CASE 
            WHEN ipk >= 3.80 THEN 'Lulusan Terbaik (Summa Cum Laude)'
            WHEN ipk >= 3.50 THEN 'Lulus Memuaskan (Cum Laude)'
            WHEN ipk >= 3.00 THEN 'Sangat Memuaskan (Sesuai Target Akademik)'
            WHEN ipk >= 2.75 THEN 'Memuaskan (Perlu Peningkatan SKS Tambahan)'
            ELSE 'Evaluasi Khusus (IPK Di Bawah Standar Minimum)'
        END
    ) STORED
);


-- TABEL KRS (Transaksi Pengambilan Matkul)

CREATE TABLE SALAM.krs (
    id_krs SERIAL PRIMARY KEY,
    nim VARCHAR(10) REFERENCES SALAM.mahasiswas(nim) ON DELETE CASCADE,
    id_jadwal INT REFERENCES SALAM.jadwal(id_jadwal) ON DELETE CASCADE,
    semester VARCHAR(15) NOT NULL,
    
    CONSTRAINT unique_krs UNIQUE (nim, id_jadwal)
);