-- Migration number: 0001 	 2024-10-22T09:00:54.587Z
DROP TABLE IF EXISTS pages;
CREATE TABLE IF NOT EXISTS pages (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    screenshotId TEXT,
    title TEXT NOT NULL,
    contentUrl TEXT NOT NULL,
    pageUrl TEXT NOT NULL,
    folderId INTEGER NOT NULL,
    pageDesc TEXT NOT NULL DEFAULT '',
    isDeleted BOOLEAN NOT NULL DEFAULT 0,
    deletedAt DATETIME,
    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_pages_id ON pages(id);
CREATE INDEX IF NOT EXISTS idx_pages_pageUrl ON pages(pageUrl);
CREATE INDEX IF NOT EXISTS idx_pages_folderId ON pages(folderId);

DROP TABLE IF EXISTS folders;
CREATE TABLE IF NOT EXISTS folders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    isDeleted BOOLEAN NOT NULL DEFAULT 0,
    deletedAt DATETIME,
    createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_folders_id ON folders(id);

INSERT INTO folders (name, id) VALUES ('uncategorized', 0);
