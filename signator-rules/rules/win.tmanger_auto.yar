rule win_tmanger_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.tmanger."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.tmanger"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { c741594d68b93a c7415d382cd7bd c74161d47bdb0f c741651f013f62 c74169388b8e92 c7416d9b14f6a0 c7417180fcd6bb }
            // n = 7, score = 200
            //   c741594d68b93a       | jne                 0x102
            //   c7415d382cd7bd       | cmp                 dword ptr [ebp + 8], 0
            //   c74161d47bdb0f       | jne                 0xc1a
            //   c741651f013f62       | mov                 eax, dword ptr [ebx + 0x488]
            //   c74169388b8e92       | mov                 dword ptr [ebp - 0x94], eax
            //   c7416d9b14f6a0       | test                eax, eax
            //   c7417180fcd6bb       | lea                 eax, [ebx + 0x480]

        $sequence_1 = { c7410491b20524 c74108cc6188ff c7410c16d9fdf8 c741103a71c135 }
            // n = 4, score = 200
            //   c7410491b20524       | lea                 ecx, [ebp - 0xd0]
            //   c74108cc6188ff       | and                 dword ptr [ebp - 4], 0
            //   c7410c16d9fdf8       | lea                 eax, [ebx + 0x3dc]
            //   c741103a71c135       | lea                 ecx, [ebp - 0xd0]

        $sequence_2 = { c741103a71c135 c74114c2a02ab0 c74118d95dc845 c7411cf8f0564e c7412066b8276e c7412425d933d1 }
            // n = 6, score = 200
            //   c741103a71c135       | push                eax
            //   c74114c2a02ab0       | push                dword ptr [ebp + 8]
            //   c74118d95dc845       | lea                 edi, [ebx + 0xc0]
            //   c7411cf8f0564e       | lea                 eax, [ebx + 0x90]
            //   c7412066b8276e       | push                eax
            //   c7412425d933d1       | lea                 eax, [ebx + 0x78]

        $sequence_3 = { c7412066b8276e c7412425d933d1 c7412861fdc72a c7412cdf9134d2 c74130324d251d c74134375ec19d c7413893c82e55 }
            // n = 7, score = 200
            //   c7412066b8276e       | lea                 ecx, [ebp - 0x3b0]
            //   c7412425d933d1       | lea                 eax, [ebx + 0x348]
            //   c7412861fdc72a       | mov                 byte ptr [ebp - 4], 0x77
            //   c7412cdf9134d2       | push                eax
            //   c74130324d251d       | lea                 eax, [ebp - 0x54]
            //   c74134375ec19d       | push                eax
            //   c7413893c82e55       | lea                 ecx, [ebp - 0x38]

        $sequence_4 = { c741594d68b93a c7415d382cd7bd c74161d47bdb0f c741651f013f62 c74169388b8e92 }
            // n = 5, score = 200
            //   c741594d68b93a       | lea                 edi, [edx + 8]
            //   c7415d382cd7bd       | push                4
            //   c74161d47bdb0f       | mov                 dword ptr [ebp - 0x10], edi
            //   c741651f013f62       | pop                 esi
            //   c74169388b8e92       | lea                 ebx, [eax - 4]

        $sequence_5 = { c741510f9f2997 c7415565449eac c741594d68b93a c7415d382cd7bd c74161d47bdb0f }
            // n = 5, score = 200
            //   c741510f9f2997       | lea                 edi, [ecx + 0x44]
            //   c7415565449eac       | mov                 dword ptr [ebp - 0x11c], eax
            //   c741594d68b93a       | movsd               dword ptr es:[edi], dword ptr [esi]
            //   c7415d382cd7bd       | movsd               dword ptr es:[edi], dword ptr [esi]
            //   c74161d47bdb0f       | movsd               dword ptr es:[edi], dword ptr [esi]

        $sequence_6 = { c7415d382cd7bd c74161d47bdb0f c741651f013f62 c74169388b8e92 }
            // n = 4, score = 200
            //   c7415d382cd7bd       | lea                 ecx, [ebp - 0x3c0]
            //   c74161d47bdb0f       | lea                 eax, [ebp - 0x39c]
            //   c741651f013f62       | lea                 ecx, [ebp - 0x3c0]
            //   c74169388b8e92       | lea                 eax, [ebx + 0x8fc0]

        $sequence_7 = { c7414dd22a7e91 c741510f9f2997 c7415565449eac c741594d68b93a c7415d382cd7bd }
            // n = 5, score = 200
            //   c7414dd22a7e91       | movsd               dword ptr es:[edi], dword ptr [esi]
            //   c741510f9f2997       | lea                 edi, [ecx + 0x40]
            //   c7415565449eac       | lea                 eax, [ebp - 8]
            //   c741594d68b93a       | mov                 ecx, edi
            //   c7415d382cd7bd       | push                eax

        $sequence_8 = { c74149ff663a9d c7414dd22a7e91 c741510f9f2997 c7415565449eac }
            // n = 4, score = 200
            //   c74149ff663a9d       | lea                 ecx, [ebp - 0x3e0]
            //   c7414dd22a7e91       | lea                 ecx, [ebp - 0x3c4]
            //   c741510f9f2997       | lea                 ecx, [ebp - 0x3c4]
            //   c7415565449eac       | lea                 ecx, [ebp - 0x3c4]

        $sequence_9 = { c7411cf8f0564e c7412066b8276e c7412425d933d1 c7412861fdc72a c7412cdf9134d2 c74130324d251d }
            // n = 6, score = 200
            //   c7411cf8f0564e       | lea                 eax, [ebp - 0x54]
            //   c7412066b8276e       | push                eax
            //   c7412425d933d1       | lea                 ecx, [ebp - 0x38]
            //   c7412861fdc72a       | lea                 eax, [ebx + 0x8fa0]
            //   c7412cdf9134d2       | mov                 byte ptr [ebp - 4], 0x5f
            //   c74130324d251d       | push                eax

    condition:
        7 of them and filesize < 8252416
}