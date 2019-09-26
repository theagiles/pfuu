CREATE TABLE assessments (id BIGINT AUTO_INCREMENT, checklist_id BIGINT NOT NULL, reference VARCHAR(255) NOT NULL, day INT, month INT, year INT, day_of_week TEXT, version_at DATETIME NOT NULL, value DOUBLE(18, 2) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX checklist_id_idx (checklist_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE check_list (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL, observations LONGTEXT, reference VARCHAR(255), template_id BIGINT NOT NULL, responsible_id BIGINT NOT NULL, original_threshold BIGINT NOT NULL, assessment FLOAT(18, 2), status TINYINT(1) DEFAULT '1' NOT NULL, version_at DATETIME, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX template_id_idx (template_id), INDEX responsible_id_idx (responsible_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE checked_standard (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL, description LONGTEXT, standard_type VARCHAR(255), checklist_id BIGINT NOT NULL, final_weight DOUBLE(18, 2), option_selected VARCHAR(255), assigned_value DOUBLE(18, 2), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX checklist_id_idx (checklist_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE standard (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL, description LONGTEXT, template_id BIGINT NOT NULL, weight DOUBLE(18, 2), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX template_id_idx (template_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE template (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL, description LONGTEXT, prefix VARCHAR(255), threshold BIGINT NOT NULL, checklists_qt BIGINT, status TINYINT(1) DEFAULT '1' NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_forgot_password (id BIGINT AUTO_INCREMENT, user_id BIGINT NOT NULL, unique_key VARCHAR(255), expires_at DATETIME NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group (id BIGINT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group_permission (group_id BIGINT, permission_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(group_id, permission_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_permission (id BIGINT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_remember_key (id BIGINT AUTO_INCREMENT, user_id BIGINT, remember_key VARCHAR(32), ip_address VARCHAR(50), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user (id BIGINT AUTO_INCREMENT, first_name VARCHAR(255), last_name VARCHAR(255), email_address VARCHAR(255) NOT NULL UNIQUE, username VARCHAR(128) NOT NULL UNIQUE, algorithm VARCHAR(128) DEFAULT 'sha1' NOT NULL, salt VARCHAR(128), password VARCHAR(128), is_active TINYINT(1) DEFAULT '1', is_super_admin TINYINT(1) DEFAULT '0', last_login DATETIME, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX is_active_idx_idx (is_active), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_group (user_id BIGINT, group_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, group_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_permission (user_id BIGINT, permission_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, permission_id)) ENGINE = INNODB;
ALTER TABLE assessments ADD CONSTRAINT assessments_checklist_id_check_list_id FOREIGN KEY (checklist_id) REFERENCES check_list(id) ON DELETE CASCADE;
ALTER TABLE check_list ADD CONSTRAINT check_list_template_id_template_id FOREIGN KEY (template_id) REFERENCES template(id);
ALTER TABLE check_list ADD CONSTRAINT check_list_responsible_id_sf_guard_user_id FOREIGN KEY (responsible_id) REFERENCES sf_guard_user(id);
ALTER TABLE checked_standard ADD CONSTRAINT checked_standard_checklist_id_check_list_id FOREIGN KEY (checklist_id) REFERENCES check_list(id) ON DELETE CASCADE;
ALTER TABLE standard ADD CONSTRAINT standard_template_id_template_id FOREIGN KEY (template_id) REFERENCES template(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_forgot_password ADD CONSTRAINT sf_guard_forgot_password_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_remember_key ADD CONSTRAINT sf_guard_remember_key_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
