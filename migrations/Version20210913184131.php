<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210913184131 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE critere_scenario (critere_id INT NOT NULL, scenario_id INT NOT NULL, INDEX IDX_DDD3D96E9E5F45AB (critere_id), INDEX IDX_DDD3D96EE04E49DF (scenario_id), PRIMARY KEY(critere_id, scenario_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE critere_client (critere_id INT NOT NULL, client_id INT NOT NULL, INDEX IDX_D224DB029E5F45AB (critere_id), INDEX IDX_D224DB0219EB6921 (client_id), PRIMARY KEY(critere_id, client_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE critere_scenario ADD CONSTRAINT FK_DDD3D96E9E5F45AB FOREIGN KEY (critere_id) REFERENCES critere (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE critere_scenario ADD CONSTRAINT FK_DDD3D96EE04E49DF FOREIGN KEY (scenario_id) REFERENCES scenario (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE critere_client ADD CONSTRAINT FK_D224DB029E5F45AB FOREIGN KEY (critere_id) REFERENCES critere (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE critere_client ADD CONSTRAINT FK_D224DB0219EB6921 FOREIGN KEY (client_id) REFERENCES client (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE critere DROP FOREIGN KEY FK_7F6A805319EB6921');
        $this->addSql('DROP INDEX IDX_7F6A805319EB6921 ON critere');
        $this->addSql('ALTER TABLE critere DROP client_id, DROP locataire, DROP celibataire');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE critere_scenario');
        $this->addSql('DROP TABLE critere_client');
        $this->addSql('ALTER TABLE critere ADD client_id INT NOT NULL, ADD locataire TINYINT(1) NOT NULL, ADD celibataire TINYINT(1) NOT NULL');
        $this->addSql('ALTER TABLE critere ADD CONSTRAINT FK_7F6A805319EB6921 FOREIGN KEY (client_id) REFERENCES client (id)');
        $this->addSql('CREATE INDEX IDX_7F6A805319EB6921 ON critere (client_id)');
    }
}
