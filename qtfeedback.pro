TEMPLATE = subdirs
SUBDIRS += src examples

# Generate docs
QDOC = $$[QT_INSTALL_BINS]/qdoc
QDOCCONF = $$PWD/doc/qtfeedback.qdocconf
QHELP_GENERATOR = $$[QT_INSTALL_BINS]/qhelpgenerator
!exists($$QHELP_GENERATOR) {
	QHELP_GENERATOR = $$[QT_INSTALL_BINS]/../libexec/qhelpgenerator
}
DOCS_OUTPUT_DIR=$$PWD/doc-build

# Set environment variables referred to by qtfeedback.qdocconf
docs.commands = QT_INSTALL_DOCS=$$[QT_INSTALL_DOCS] QT_VERSION=$$QT_VERSION QT_VERSION_TAG=$$QT_VERSION QT_VER=$$QT_MAJOR_VERSION BUILDDIR=$$DOCS_OUTPUT_DIR
# Generate documentation
docs.commands += $$QDOC $$QDOCCONF --outputdir $$DOCS_OUTPUT_DIR
# Generate a compressed version
docs.commands += $$escape_expand(\n\t) $$QHELP_GENERATOR -o $$DOCS_OUTPUT_DIR/qtfeedback.qch $$DOCS_OUTPUT_DIR/qtfeedback.qhp
docs.target = docs
docs.CONFIG += phony
QMAKE_EXTRA_TARGETS += docs

install_qch_docs.depends = docs
install_qch_docs.commands = install -Dm644 $$DOCS_OUTPUT_DIR/qtfeedback.qch $(INSTALL_ROOT)$$[QT_INSTALL_DOCS]/qtfeedback.qch
install_qch_docs.CONFIG += phony
QMAKE_EXTRA_TARGETS += install_qch_docs
