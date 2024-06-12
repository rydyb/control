from artiq.experiment import EnvExperiment


class MyExperiment(EnvExperiment):
    def build(self):
        self.setattr_device("core")
