Create database [recurosDB]
-- Creating table 'Cargos'
CREATE TABLE [dbo].[Cargos] (
    [CodigoCargo] int  NOT NULL,
    [Cargo] char(20)  NULL
);
GO

-- Creating table 'Departamentos'
CREATE TABLE [dbo].[Departamentos] (
    [CodigoDepartamento] int  NOT NULL,
    [Nombre] char(20)  NULL
);
GO

-- Creating table 'Empleados'
CREATE TABLE [dbo].[Empleados] (
    [CodigoEmpleado] int  NOT NULL,
    [Nombre] char(20)  NULL,
    [Apellido] char(20)  NULL,
    [Telefono] int  NULL,
    [Departamento] char(20)  NULL,
    [Cargo] char(20)  NULL,
    [FechaIngreso] datetime  NULL,
    [Salario] decimal(19,4)  NULL,
    [CodigoDepartamento] int  NOT NULL,
    [CodigoCargo] int  NOT NULL,
    [Estatus] char(10)  NULL
);
GO

-- Creating table 'Licencias'
CREATE TABLE [dbo].[Licencias] (
    [ID] int  NOT NULL,
    [CodigoEmpleado] int  NOT NULL,
    [Empleado] char(20)  NULL,
    [FechaInicial] datetime  NULL,
    [FechaFinal] datetime  NULL,
    [Motivo] char(20)  NULL,
    [Comentario] char(50)  NULL
);
GO

-- Creating table 'Nomina'
CREATE TABLE [dbo].[Nomina] (
    [ID] int  NOT NULL,
    [Empleado] char(20)  NULL,
    [A�o] char(4)  NULL,
    [Mes] char(10)  NULL,
    [MontoTotal] decimal(19,4)  NULL,
    [CodigoEmpleado] int  NOT NULL
);
GO

-- Creating table 'Permisos'
CREATE TABLE [dbo].[Permisos] (
    [ID] int  NOT NULL,
    [Empleado] char(20)  NULL,
    [CodigoEmpleado] int  NOT NULL,
    [FechaInicial] datetime  NULL,
    [FechaFinal] datetime  NULL,
    [Comentarios] char(50)  NULL
);
GO

-- Creating table 'Salidas'
CREATE TABLE [dbo].[Salidas] (
    [ID] int  NOT NULL,
    [CodigoEmpleado] int  NOT NULL,
    [TipoSalida] char(15)  NULL,
    [Empleado] char(20)  NULL,
    [Motivo] char(20)  NULL,
    [FechaSalida] datetime  NULL
);
GO

-- Creating table 'Vacaciones'
CREATE TABLE [dbo].[Vacaciones] (
    [ID] int  NOT NULL,
    [CodigoEmpleado] int  NOT NULL,
    [Empleado] char(20)  NULL,
    [FechaInicial] datetime  NULL,
    [FechaFinal] datetime  NULL,
    [Comentario] char(50)  NULL,
    [A�o] datetime  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CodigoCargo] in table 'Cargos'
ALTER TABLE [dbo].[Cargos]
ADD CONSTRAINT [PK_Cargos]
    PRIMARY KEY CLUSTERED ([CodigoCargo] ASC);
GO

-- Creating primary key on [CodigoDepartamento] in table 'Departamentos'
ALTER TABLE [dbo].[Departamentos]
ADD CONSTRAINT [PK_Departamentos]
    PRIMARY KEY CLUSTERED ([CodigoDepartamento] ASC);
GO

-- Creating primary key on [CodigoEmpleado] in table 'Empleados'
ALTER TABLE [dbo].[Empleados]
ADD CONSTRAINT [PK_Empleados]
    PRIMARY KEY CLUSTERED ([CodigoEmpleado] ASC);
GO

-- Creating primary key on [ID] in table 'Licencias'
ALTER TABLE [dbo].[Licencias]
ADD CONSTRAINT [PK_Licencias]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Nomina'
ALTER TABLE [dbo].[Nomina]
ADD CONSTRAINT [PK_Nomina]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Permisos'
ALTER TABLE [dbo].[Permisos]
ADD CONSTRAINT [PK_Permisos]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Salidas'
ALTER TABLE [dbo].[Salidas]
ADD CONSTRAINT [PK_Salidas]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Vacaciones'
ALTER TABLE [dbo].[Vacaciones]
ADD CONSTRAINT [PK_Vacaciones]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CodigoCargo] in table 'Empleados'
ALTER TABLE [dbo].[Empleados]
ADD CONSTRAINT [FK_CodigoCargo]
    FOREIGN KEY ([CodigoCargo])
    REFERENCES [dbo].[Cargos]
        ([CodigoCargo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CodigoCargo'
CREATE INDEX [IX_FK_CodigoCargo]
ON [dbo].[Empleados]
    ([CodigoCargo]);
GO

-- Creating foreign key on [CodigoDepartamento] in table 'Empleados'
ALTER TABLE [dbo].[Empleados]
ADD CONSTRAINT [FK_CodigoDepartamento]
    FOREIGN KEY ([CodigoDepartamento])
    REFERENCES [dbo].[Departamentos]
        ([CodigoDepartamento])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CodigoDepartamento'
CREATE INDEX [IX_FK_CodigoDepartamento]
ON [dbo].[Empleados]
    ([CodigoDepartamento]);
GO

-- Creating foreign key on [CodigoEmpleado] in table 'Nomina'
ALTER TABLE [dbo].[Nomina]
ADD CONSTRAINT [FK_CodigoEmpleado]
    FOREIGN KEY ([CodigoEmpleado])
    REFERENCES [dbo].[Empleados]
        ([CodigoEmpleado])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CodigoEmpleado'
CREATE INDEX [IX_FK_CodigoEmpleado]
ON [dbo].[Nomina]
    ([CodigoEmpleado]);
GO

-- Creating foreign key on [CodigoEmpleado] in table 'Nomina'
ALTER TABLE [dbo].[Nomina]
ADD CONSTRAINT [FK_CodigoEmpleado2]
    FOREIGN KEY ([CodigoEmpleado])
    REFERENCES [dbo].[Empleados]
        ([CodigoEmpleado])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CodigoEmpleado2'
CREATE INDEX [IX_FK_CodigoEmpleado2]
ON [dbo].[Nomina]
    ([CodigoEmpleado]);
GO

-- Creating foreign key on [CodigoEmpleado] in table 'Salidas'
ALTER TABLE [dbo].[Salidas]
ADD CONSTRAINT [FK_CodigoEmpleado3]
    FOREIGN KEY ([CodigoEmpleado])
    REFERENCES [dbo].[Empleados]
        ([CodigoEmpleado])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CodigoEmpleado3'
CREATE INDEX [IX_FK_CodigoEmpleado3]
ON [dbo].[Salidas]
    ([CodigoEmpleado]);
GO

-- Creating foreign key on [CodigoEmpleado] in table 'Vacaciones'
ALTER TABLE [dbo].[Vacaciones]
ADD CONSTRAINT [FK_CodigoEmpleado4]
    FOREIGN KEY ([CodigoEmpleado])
    REFERENCES [dbo].[Empleados]
        ([CodigoEmpleado])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CodigoEmpleado4'
CREATE INDEX [IX_FK_CodigoEmpleado4]
ON [dbo].[Vacaciones]
    ([CodigoEmpleado]);
GO

-- Creating foreign key on [CodigoEmpleado] in table 'Permisos'
ALTER TABLE [dbo].[Permisos]
ADD CONSTRAINT [FK_CodigoEmpleado5]
    FOREIGN KEY ([CodigoEmpleado])
    REFERENCES [dbo].[Empleados]
        ([CodigoEmpleado])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CodigoEmpleado5'
CREATE INDEX [IX_FK_CodigoEmpleado5]
ON [dbo].[Permisos]
    ([CodigoEmpleado]);
GO

-- Creating foreign key on [CodigoEmpleado] in table 'Licencias'
ALTER TABLE [dbo].[Licencias]
ADD CONSTRAINT [FK_CodigoEmpleado6]
    FOREIGN KEY ([CodigoEmpleado])
    REFERENCES [dbo].[Empleados]
        ([CodigoEmpleado])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CodigoEmpleado6'
CREATE INDEX [IX_FK_CodigoEmpleado6]
ON [dbo].[Licencias]
    ([CodigoEmpleado]);
GO

IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CodigoCargo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Empleados] DROP CONSTRAINT [FK_CodigoCargo];
GO
IF OBJECT_ID(N'[dbo].[FK_CodigoDepartamento]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Empleados] DROP CONSTRAINT [FK_CodigoDepartamento];
GO
IF OBJECT_ID(N'[dbo].[FK_CodigoEmpleado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Nomina] DROP CONSTRAINT [FK_CodigoEmpleado];
GO
IF OBJECT_ID(N'[dbo].[FK_CodigoEmpleado2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Nomina] DROP CONSTRAINT [FK_CodigoEmpleado2];
GO
IF OBJECT_ID(N'[dbo].[FK_CodigoEmpleado3]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Salidas] DROP CONSTRAINT [FK_CodigoEmpleado3];
GO
IF OBJECT_ID(N'[dbo].[FK_CodigoEmpleado4]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Vacaciones] DROP CONSTRAINT [FK_CodigoEmpleado4];
GO
IF OBJECT_ID(N'[dbo].[FK_CodigoEmpleado5]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Permisos] DROP CONSTRAINT [FK_CodigoEmpleado5];
GO
IF OBJECT_ID(N'[dbo].[FK_CodigoEmpleado6]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Licencias] DROP CONSTRAINT [FK_CodigoEmpleado6];
GO